<?php

class Current_server_time extends MX_Controller
{	
	public function __construct()
	{
		parent::__construct();

		$this->load->config('sidebox_current_server_time/time_config');
	}

	public function view()
	{
        $server_time_text_color = $this->config->item('server_time_text_color');
		$server_time_text_size = $this->config->item('server_time_text_size');

        $dateAndTime = $this->getCurrentServerDateAndTime();

		$templateData = array(
					"module" => "sidebox_current_server_time", 
					"server_time_text_color" => $server_time_text_color,
					"server_time_text_size" => $server_time_text_size,
					"dateAndTime" => $dateAndTime
				);

		$load = $this->template->loadPage("current_server_time.tpl", $templateData);

		return $load;
	}

	private function getCurrentServerDateAndTime()
	{
		$server_time_php_format = $this->config->item('server_time_php_format');
		$server_time_php_default_timezone = $this->config->item('server_time_php_default_timezone');

	    date_default_timezone_set($server_time_php_default_timezone);
        $dateString = date($server_time_php_format);

		return $dateString;
	}
}
