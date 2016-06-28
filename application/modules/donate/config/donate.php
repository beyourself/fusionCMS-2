&lt;?php

/*
|--------------------------------------------------------------------------
| General settings
|--------------------------------------------------------------------------
*/

$config['donation_currency'] = "USD"; // Remember to change the currency ON PayGol as well!
$config['donation_currency_sign'] = "$";

/*
|--------------------------------------------------------------------------
| PayPal Donation (www.paypal.com)
|--------------------------------------------------------------------------
*/

$config['donate_paypal'] = array(
 'use' => true, // true: enable | false: disable
 'postback_url' => "http://klimax.mwow.dk/donate/postback_paypal",
 'return_url' => "http://klimax.mwow.dk/donate/success",
 'email' => "achibod.cranee@mail.com",
 'sandbox' => false, // false: live servers | true: testing/dev servers
 
 'values' => array(

  // Format: PRICE => DP
  // Example: 5 => 15 which would cause 5 USD
  // (or your specified currency) to give 15 DP

  7 => 7,
  14 => 16,
  21 => 25,
  28 => 34,
  36 => 42,
  43 => 51,
  50 => 60
 ),

);

/*
|--------------------------------------------------------------------------
| PayGol Donation (www.paygol.com)
|--------------------------------------------------------------------------
*/

$config['donate_paygol'] = array(
 'use' => false, // true: enable | false: disable
 'service_id' => 123456, // Your PayGol service ID
 'cancel_url' => "http://YOURSERVER.COM/donate",
 'return_url' => "http://YOURSERVER.COM/donate/success",
 
 'values' => array(

  // Format: PRICE => DP
  // Example: 5 => 15 which would cause 5 USD
  // (or your specified currency) to give 15 DP

  20 => 30,
  30 => 40,
  40 => 60,
  60 => 90,
 ),

);

/*
|--------------------------------------------------------------------------
| Paymentwall Donation (www.paymentwall.com)
|--------------------------------------------------------------------------
*/

$config['donate_paymentwall'] = array(
 'use'               => true,
 'key'               => 'ab486666ae2284d4c5eef819c06d189c',
 'secret_key'        => 'bf9a4b4f82f17f407aafa98847c04da7',
 'widget_code'       => 'p1_1',

 // Test mode (used for Paymentwall approval)
 // When enabled, only the user with the given ID will be able to use the
 // Paymentwall donation, even if Paymentwall is disabled.
 // You can create a test user dedicated for the approval.
 'test_mode' => true,
 'test_user' => 1,
);

/*******************************************************************/
/******************* Only Jesper allowed ***************************/
/*******************************************************************/

// Touch it and I'll kill you! >:(
$config['force_code_editor'] = true;