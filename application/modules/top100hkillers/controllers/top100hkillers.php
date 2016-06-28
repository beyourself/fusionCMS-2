<?php

class Top100hkillers extends MX_Controller
{
	function __construct()
	{
		//Call the constructor of MX_Controller
		parent::__construct();
		
		$this->load->model("data_model");
		$this->load->config('top100hkillers');
	}
	
	public function index($RealmId = false)
	{
		$this->template->setTitle("Top 100 Honorable Killers");
		
		$user_id = $this->user->getId();
		
		$data = array(
			'user_id' 			=> $user_id,
			'realms_count'		=> count($this->realms),
			'selected_realm'	=> $RealmId,
			'url' 				=> $this->template->page_url,
		);
		
		// Get the realms
		if (count($this->realms) > 0)
		{
			foreach ($this->realms->getRealms() as $realm)
			{
				//Set the first realm as realmid
				if (!$RealmId)
				{
					$RealmId = $realm->getId();
					$data['selected_realm']	= $RealmId;
				}
					
				$data['realms'][$realm->getId()] = array('name' => $realm->getName());
			}
		}
		
		//Set the realmid for the data model
		$this->data_model->setRealm($RealmId);
		
		//Get Top Honorable Kills Players
		$data['TopHK'] = $this->data_model->getTopHKPlayers($this->config->item("hk_players_limit"));
		
		$output = $this->template->loadPage("top100hkillers.tpl", $data);

		$this->template->box("Top 100 Honorable Killers", $output, true, "modules/top100hkillers/css/style.css", "modules/top100hkillers/js/scripts.js");
	}
}
