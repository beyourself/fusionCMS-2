<?php

class Vote_model extends CI_Model
{
	private $vote_sites;

	/**
	 * Connect to the database
	 */
	public function __construct()
	{
		parent::__construct();
		
		if($this->config->item('delete_old_votes'))
			$this->deleteOld();

		//init our vote sites
		$this->vote_sites = $this->getVoteSites();
		
		if($this->vote_sites)
		{
			foreach($this->vote_sites as $key => $value)
			{
				$canVote = (bool)$this->canVote($value['id']);
				$this->vote_sites[$key]['canVote'] = $canVote;
				$this->vote_sites[$key]['nextVote'] = $canVote ? false : $this->getNextTime($value['id']);
			}
		}
	}
	
	public function getVoteSites()
	{
		if($this->vote_sites)
		{
			return $this->vote_sites;
		}
		else
		{
			$query = $this->db->query("SELECT * FROM vote_sites");

			if($query->num_rows())
			{
				$result = $query->result_array();
				return $result;
			}
			else
			{
				return false;
			}
		}
	}
	
	public function getVoteSite($id)
	{
		foreach($this->vote_sites as $key => $value)
		{
			if($value['id'] == $id)
			{
				return $this->vote_sites[$key];
			}
		}
	}

	public function getTopsite($id)
	{
		$query = $this->db->query("SELECT * FROM vote_sites WHERE id=?", array($id));
		
		if($query->num_rows())
		{
			$result = $query->result_array();

			return $result[0];
		}
		else
		{
			return false;
		}
	}
	
	/**
	 * Gets the vote site by url, handy for the postback scripts.
	 */
	public function getVoteSiteByUrl($url)
	{
		$query = $this->db->query("SELECT * FROM vote_sites WHERE vote_url LIKE '%".$url."%'");
		
		if($query->num_rows())
		{
			$result = $query->result_array();

			return $result[0];
		}
		else
		{
			return false;
		}
	}

	/**
	 * @param int $vote_site_id
	 * @param null $time_back
	 * @param null $ip
	 * @param null $user_id
	 * @return CI_DB_driver
	 */
	public function getVoteLog(int $vote_site_id, $time_back = null, $ip = null, $user_id = null)
	{
		// if null given, pull from object(s).
		$user_id = !is_null($user_id) ? $user_id : $this->user->getId();
		$ip = !is_null($ip) ? $ip : $this->input->ip_address();

		// Build $clauses array from variables.
		$clauses = compact('vote_site_id', 'ip', 'user_id');

		// Check if ip locking is enabled, if not remove ip from clauses.
		// !$vote_site['callback_enabled']
		if($this->config->item('vote_ip_lock') === False)
		{
			unset($clauses['ip']);
		}

		// Check if a estimate time left before expire is given,
		// else calculate from now by subtracting defined time_interval
		if(is_null($time_back))
		{
			// Get the vote site
			$vote_site = $this->getVoteSite($vote_site_id);

			// Get the hours between each vote
			$time_interval = $vote_site['hour_interval'];

			// Calculate the that should tell if they voted already or not.
			$time_back = time() - ($time_interval * 60 * 60);
		}

		// get where the time left is greater than or equal to now.
		return $this->db->where($clauses)->where('time >=', $time_back)->get('vote_log');
	}

	private function deleteOld()
	{
		$time_back = time() - (24 * 60 * 60);
		$this->db->query("DELETE FROM vote_log WHERE `time` < (SELECT MAX(hour_interval) * 3600 FROM vote_sites)", array($time_back));
	}

	/**
	 * @param $vote_site_id
	 * @return bool
	 */
	public function getNextTime($vote_site_id)
	{
			$vote_site = $this->getVoteSite($vote_site_id);
			$time_interval = $vote_site['hour_interval'];
			$time = time() - ($time_interval * 60 * 60);

			$query = $this->getVoteLog($vote_site_id, $time);
			if($query->num_rows() > 0)
			{
				$row = $query->result_array();

				$nextTime = $row[0]['time'] + ($time_interval * 60 * 60);
				$untilNext = $nextTime - time();

				return $this->template->formatTime($untilNext);
			}
			else
			{
				return false;
			}
	}
	
	public function vote_log($user_id, $user_ip, $voteSiteId)
	{
		//Insert into the logs.
		$data = array(
			'vote_site_id' => $voteSiteId,
			'user_id' => $user_id,
			'ip' => $user_ip,
			'time' => time()
		);
		
		$insert = $this->db->insert('vote_log', $data);

		if($insert)
		{
			$this->db->query("UPDATE account_data SET total_votes = total_votes + 1 WHERE id = ?", array($this->user->getId()));
		
			//Return true if we voted
			return true;
		}
		else
		{
			return false;
		}
	}

	public function updateVp($user_id, $extra_vp)
	{
		//Update account vp
		$this->db->query("UPDATE account_data SET `vp` = vp + ? WHERE id=?", array($extra_vp, $user_id));
		
		//Update the session
		$this->session->set_userdata('vp', $this->user->getVp() + $extra_vp);

		$this->updateMonthlyVotes();
	}

	private function updateMonthlyVotes()
	{
		$query = $this->db->query("SELECT COUNT(*) AS `total` FROM monthly_votes WHERE month=?", array(date("Y-m")));

		$row = $query->result_array();

		if($row[0]['total'])
		{
			$this->db->query("UPDATE monthly_votes SET amount = amount + 1 WHERE month=?", array(date("Y-m")));
		}
		else
		{
			$this->db->query("INSERT INTO monthly_votes(month, amount) VALUES(?, ?)", array(date("Y-m"), 1));
		}
	}
	
	/**
	 * Checks if the current user can vote for the given site
	 * at this time.
	 * @param int $vote_site_id ID of the vote site
	 * @param string $user_id Optional: ID of the user to check
	 * @param string $user_ip Optional: IP of the user to check
	 * @return bool
	 */
	public function canVote(int $vote_site_id, $user_id = null, $ip = null)
	{
		$query = $this->getVoteLog($vote_site_id, null, $ip, $user_id);
		
		if($query->num_rows() > 0)
		{
			//Voted already
			return false;
		}
		else 
		{
			return true;
		}
	}
	
	public function add($data)
	{
		$this->db->insert("vote_sites", $data);
	}

	public function edit($id, $data)
	{
		$this->db->where('id', $id);
		$this->db->update('vote_sites', $data);
	}

	public function delete($id)
	{
		$this->db->query("DELETE FROM vote_sites WHERE id=?", array($id));
	}
}