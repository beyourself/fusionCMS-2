<?php

class Data_model extends CI_Model
{
	public $realm;
	private $connection;
	private $emuStr = false;
	private $statements = array();
	
	public function __construct()
	{
		parent::__construct();
		
		/* Let's prepare our SQL statements */
		$this->statements['mangoszero'] = array(
			'TopArenaTeams'	=>	"SELECT `arena_team`.`arenateamid` AS arenateamid, 
										`arena_team_stats`.`rating` AS rating, 
										`arena_team_stats`.`rank` AS rank, 
										`arena_team`.`name` AS name, 
										`arena_team`.`captainguid` AS captain, 
										`arena_team`.`type` AS type
									FROM `arena_team`, `arena_team_stats`
									WHERE `arena_team`.`arenateamid` = `arena_team_stats`.`arenateamid` AND `arena_team`.`type` = ? 
									ORDER BY `arena_team_stats`.`rating` DESC LIMIT ?;",
			'TeamMembers'	=> 	"SELECT 
									`arena_team_member`.`arenateamid` AS arenateamid, 
									`arena_team_member`.`guid` AS guid, 
									`arena_team_member`.`personal_rating` AS rating,
									`arena_team_member`.`played_season` AS games,
									`arena_team_member`.`wons_season` AS wins,
									`characters`.`name` AS name,
									`characters`.`class` AS class,
									`characters`.`level` AS level
								FROM `arena_team_member` 
								RIGHT JOIN `characters` ON `characters`.`guid` = `arena_team_member`.`guid` 
								WHERE `arena_team_member`.`arenateamid` = ? ORDER BY guid ASC;",
		);

		$this->statements['razorcore4'] = array(
			'TopArenaTeams'	=>	"SELECT `arena_team`.`arenateamid` AS arenateamid, 
										`arena_team_stats`.`rating` AS rating, 
										`arena_team_stats`.`rank` AS rank, 
										`arena_team`.`name` AS name, 
										`arena_team`.`captainguid` AS captain, 
										`arena_team`.`type` AS type
									FROM `arena_team`, `arena_team_stats`
									WHERE `arena_team`.`arenateamid` = `arena_team_stats`.`arenateamid` AND `arena_team`.`type` = ? 
									ORDER BY `arena_team_stats`.`rating` DESC LIMIT ?;",
			'TeamMembers'	=> 	"SELECT 
									`arena_team_member`.`arenateamid` AS arenateamid, 
									`arena_team_member`.`guid` AS guid, 
									`arena_team_member`.`personal_rating` AS rating,
									`arena_team_member`.`played_season` AS games,
									`arena_team_member`.`wons_season` AS wins,
									`characters`.`name` AS name,
									`characters`.`class` AS class,
									`characters`.`level` AS level
								FROM `arena_team_member` 
								RIGHT JOIN `characters` ON `characters`.`guid` = `arena_team_member`.`guid` 
								WHERE `arena_team_member`.`arenateamid` = ? ORDER BY guid ASC;",
		);
	}

	public function GetStatement($key)
	{
		if (!$this->emuStr)
			return false;

		if (!isset($this->statements[$this->emuStr][$key]))
			return false;
			
		return $this->statements[$this->emuStr][$key];
	}

	/**
	 * Assign the realm object to the model
	 */
	public function setRealm($id)
	{
		$this->realm = $this->realms->getRealm($id);
		
		$replace = array('_ra', '_soap', '_rbac');
		//Remove the ra/soap crap
		$this->emuStr = str_replace($replace, '', $this->realm->getConfig('emulator'));
	}

	/**
	 * Connect to the character database
	 */
	public function connect()
	{
		$this->realm->getCharacters()->connect();
		$this->connection = $this->realm->getCharacters()->getConnection();
	}

	/***************************************
	* 	 	  TOP ARENA FUNCTIONS
	***************************************/

	public function getTeams($count = 50, $type = 2)
	{
		//make sure the count param is digit
		if (!ctype_digit($count))
		{
			$count = 50;
		}
		
		$this->connect();
		
		$result = $this->connection->query($this->GetStatement('TopArenaTeams'), array($type, $count));
		
		if($result && $result->num_rows() > 0)
		{
			$teams = $result->result_array();
			
			// Get the team members
			if ($teams)
			{
				foreach ($teams as $key => $arr)
				{
					$members = $this->getTeamMembers((int)$arr['arenateamid']);
					//Save the team members
					$teams[$key]['members'] = $members;
				}
			}
			
			return $teams;
		}
		
		unset($result);
		
		return false;
	}

	public function getTeamMembers($team)
	{		
		$this->connect();
		
		$result = $this->connection->query($this->GetStatement('TeamMembers'), array($team));
		
		if($result && $result->num_rows() > 0)
		{
			return $result->result_array();
		}
		
		unset($result);
		
		return false;
	}
}