<?php
require __DIR__."/vendor/autoload.php";
//require __DIR__.'/../application/emulators/trinity_soap.php';
// Can't be arsed to solve which interface it uses and couldn't find an easy way to pull it from CodeIgniters container, without instantiating the entire application..

use PHPUnit\Framework\TestCase;

class SoapTest extends TestCase
{
    // Change these
    protected $config = [
        'hostname'          =>  'play.klimax.mwow.dk',
        'console_port'      =>  '7878',
        'console_username'  =>  'test',
        'console_password'  =>  'test'
    ];

    public function testCanSend($command = 'hello')
    {
        $hostname = $this->config['hostname'];
        $host = filter_var($hostname, FILTER_VALIDATE_IP) ?: dns_get_record($hostname, DNS_A);

        switch (gettype($host))
        {
            // An ip was given as method argument.
            case "string":
                $host['ip'] = $host;
                break;

            case "array":
                if (empty($host))
                {
                    throw new \Exception("DNS Failed to resolve hostname: [$hostname]", 500);
                }
                // Since there can be multiple records returned
                // If so, grab the result where the internal pointer currently is at
                // else reset the pointer to the first index (typically 0) and grab that.
                $host = count($host) > 1 ? current($host) : reset($host);
                break;

            default:
                throw new Exception("Invalid argument given.");
                break;
        }

        $client = new SoapClient(NULL,
            array(
                "location" => "http://".$host['ip'].":".$this->config['console_port'],
                "uri" => "urn:TC",
                'login' => $this->config['console_username'],
                'password' => $this->config['console_password']
            )
        );

        try
        {
            $result = $client->executeCommand(new SoapParam($command, "command"));
        }
        catch (Exception $e)
        {
            die("Something went wrong! An administrator has been noticed and will send your order as soon as possible.<br /><br /><b>Error:</b> <br />".$e->getMessage());
        }
    }
}