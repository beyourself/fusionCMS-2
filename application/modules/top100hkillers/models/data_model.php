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
			'TopHKPlayers'	=> 	"SELECT `guid`, `name`, `level`, `race`, `class`, `gender`, `totalKills` AS kills FROM `characters` WHERE `totalKills` > 0 ORDER BY `totalKills` DESC LIMIT ?;",
		);
		$this->statements['razorcore4'] = array(
			'TopHKPlayers'	=> 	"SELECT `guid`, `name`, `level`, `race`, `class`, `gender`, `totalKills` AS kills FROM `characters` WHERE `totalKills` > 0 ORDER BY `totalKills` DESC LIMIT ?;",
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
	
	public function getTopHKPlayers($count = 50)
	{
		//make sure the count param is digit
		if (!ctype_digit($count))
		{
			$count = 50;
		}
		
		$this->connect();
		
		$result = $this->connection->query($this->GetStatement('TopHKPlayers'), array($count));
		
		if($result && $result->num_rows() > 0)
		{
			$players = $result->result_array();
			
			// Add rank
			$i = 1;
			foreach ($players as $key => $player)
			{
				$players[$key]['rank'] = $this->addNumberSuffix($i);
				$i++;
			}
			
			return $players;
		}
		
		unset($result);
		
		return false;
	}
	
	private function addNumberSuffix($num)
	{
		if (!in_array(($num % 100), array(11,12,13)))
		{
			switch ($num % 10)
			{
				// Handle 1st, 2nd, 3rd
				case 1:  return $num.'st';
				case 2:  return $num.'nd';
				case 3:  return $num.'rd';
		  	}
		}
		
		return $num.'th';
	}
}