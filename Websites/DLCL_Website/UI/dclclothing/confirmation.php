<!DOCTYPE html>
<html lang="en">
<head>
<title>DCL Team Uniform Ordering</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700,500' rel='stylesheet' type='text/css'>
</head>
<title>DCL Team Uniform Ordering</title>
<style>
.carousel-inner > .item > img,  .carousel-inner > .item > a > img {
	width: 70%;
	margin: auto;
}
body {
		font-family: 'Ubuntu', Arial, serif;
	font-size: 18px;
	margin-left: 20px;
	margin-top: 20px;
	margin-right: 20px;
	margin-bottom: 20px;
}
h3 {
	padding-top: 40px;
	color: #f70;
}
input {
	font-size: 16px;
}
select {
	font-size: 13px;
	background-color: #FFE;
}
.note {
	font-size: 12px;
	font-style: normal;
	font-weight: lighter;
}
.player-name {
	font-size: 12px;
	border-bottom-style: 1;
	border-bottom-color: #999;
}
.tshirt-name {
	text-transform: uppercase;
	background-color: #FFE;
	
}
.tshirt-number {
	background-color: #FFE;
}
.requ {
	background-color: #FFE;
}
.btn {
	background: #3498db;
	background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
	background-image: -moz-linear-gradient(top, #3498db, #2980b9);
	background-image: -ms-linear-gradient(top, #3498db, #2980b9);
	background-image: -o-linear-gradient(top, #3498db, #2980b9);
	background-image: linear-gradient(to bottom, #3498db, #2980b9);
	-webkit-border-radius: 6;
	-moz-border-radius: 6;
	border-radius: 6px;
		font-family: 'Ubuntu', Arial, serif;
	color: #ffffff;
	font-size: 26px;
	padding: 10px 100px 10px 100px;
	text-decoration: none;
}
.btn:hover {
	background: #3cb0fd;
	background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
	background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
	text-decoration: none;
}
</style>
</head><body>
<div>

  <form id="form1" name="form1" method="post" action="confirmation.php" role="form">
 	<div class="container-fluid">
 		<div align="center"><a href="ordering.php"><img src="images/logo-DCL.jpg" width="100" height="100"></a>
    <h4> 2017 Team Uniform</h4><h1>Email/Order Status</h1></div><hr />
<?php
	require_once('class.phpmailer.php');
	require_once('class.pop3.php');
	require_once('class.smtp.php');

	//$recipient = 'lokeshnaicker@gmail.com';
	  
      $from = trim($_REQUEST['from']);
      $emailaddress = trim($_REQUEST['emailaddress']);
	  
      $teamName = trim($_REQUEST['teamName']);	
      $dclDivision = trim($_REQUEST['dclDivision']);	
      $tshirtDesignFirstChoice = trim($_REQUEST['tshirtDesignFirstChoice']);	
      //$tshirtDesignSecondChoice = trim($_REQUEST['tshirtDesignSecondChoice']);	
      //$tshirtDesignThirdChoice = trim($_REQUEST['tshirtDesignThirdChoice']);
	  
	  $playerName = $_REQUEST['playerName'];
	  $tshirtName = $_REQUEST['tshirtName'];
	  $tshirtNumber = $_REQUEST['tshirtNumber'];
	  $tshirtSize = $_REQUEST['tshirtSize'];
	  $pantSize = $_REQUEST['pantSize'];
	 
      $teamPhone = trim($_REQUEST['teamPhone']);	
      $acknowledge = trim($_REQUEST['acknowledge']);	

	  //validate required fields
		$errors = array();		

		if(empty($from)) {
			$errors[] = 'Team Representative Name';
		}

		if(empty($emailaddress)) {
			$errors[] = 'Team Representative Email Address';
		}		

		if(empty($teamName)) {
			$errors[] = 'Team Name';
		}
		
		if(empty($dclDivision)) {
			$errors[] = 'Participating in DCL Division';
		}
		
		if($tshirtDesignFirstChoice == "none" || $tshirtDesignSecondChoice == "none" || $tshirtDesignThirdChoice == "none") {
			$errors[] = 'T-shirt Design Choice)';
		}
		
		//Though 36 names on roster, a minimum of 11 is required to form a teamName (+ 1: We are dealing with an array index)
		$MIN_NUM_TEAM_ROSTER = 11;
		$MAX_NUM_TEAM_ROSTER = 36;
		
		for($i = 0; $i < $MIN_NUM_TEAM_ROSTER; $i++){
			if(empty($playerName[$i])) {
				$errors[] = 'Player Name (Minimum of 11 player are required.)';
				break;
			}
		}
		  
		for($i = 0; $i < $MIN_NUM_TEAM_ROSTER; $i++){
			if(empty($tshirtName[$i])) {
				$errors[] = 'Name on T-Shirt (Minimum of 11 player are required.)';
				break;
			}
		}
		
		for($i = 0; $i < $MIN_NUM_TEAM_ROSTER; $i++){
			if(empty($tshirtNumber[$i])) {
				$errors[] = 'T-Shirt Number (Minimum of 11 player are required.)';
				break;
			}
		}
		
		for($i = 0; $i < $MIN_NUM_TEAM_ROSTER; $i++){
			if($tshirtSize[$i] == "none") {
				$errors[] = 'T-Shirt Size (Minimum of 11 player are required.)';
				break;
			}
		}
		
		for($i = 0; $i < $MIN_NUM_TEAM_ROSTER; $i++){
			if($pantSize[$i] == "none") {
				$errors[] = 'Pant Size (Minimum of 11 player are required.)';
				break;
			}
		}
	
	
		if(empty($teamPhone)) {
			$errors[] = 'Team Member Phone Number';
		}
		
		if(!isset($acknowledge)) {
			$errors[] = 'Acknowledgement of whether or not your order is correct';
		}
		
		if($errors) {
			echo '<h2 style=color:#f00">Oops! There is a problem with your form input...</h2>';
			echo '<p><strong>Please click the Back Button or use Browser Back</strong> and correct the following error(s):</p><ul>';
			
			foreach ($errors as $e) {
				echo "<li>Please enter a valid $e.</li>\n";
			}

			echo '</ul>';

		} else {
			$pop = new POP3();
			$pop->Authorise('WEBHOST_OUTGOING_SERVER_NAME', 110, 30, 'EMAIL_ADDRESS_ASSOCIATED_WITH_WEBSITE', 'PASSWORD');

			$mail = new PHPMailer();
			$body .= '<h1>' . strip_tags($teamName) . ' - Thank you for your uniform order!<h1><hr />';
			$body .= '<h2>DCL - 2017 Team Uniform Order</h2><hr /><h3>Team Details</h3>';
			
			$body .= '<table width="90%" cellpadding="5"><tbody>';
			
			$body .= '<tr><td>Team Name:</td><td>' . strip_tags($teamName) . '</td></tr>';
			$body .= '<tr><td>DCL Division:</td><td>' . strip_tags($dclDivision) . '</td></tr>';
			$body .= '<tr><td>Uniform Design Choice:</td><td>' . strip_tags($tshirtDesignFirstChoice) . '</td></tr>';
			//$body .= '<tr><td>2nd Design Choice:</td><td>' . strip_tags($tshirtDesignSecondChoice) . '</td></tr>';
			//$body .= '<tr><td>3rd Design Choice:</td><td>' . strip_tags($tshirtDesignThirdChoice) . '</td></tr>';
			$body .= '<tr><td>Submitted by:</td><td>' . strip_tags($from) . '</td></tr>';
			$body .= '<tr><td>Email:</td><td>' . strip_tags($emailaddress) . '</td></tr>';
			$body .= '<tr><td>Phone:</td><td>' . strip_tags($teamPhone) . '</td></tr>';
			
			$body .= "</tbody></table>";

			$body .= '<hr /><h3>Team Roster &amp; Tshirt Order</h3>';			
			$body .= '<table width="90%" cellpadding="5"><thead>';
			$body .= '<tr style="color:#FF7200"><td>#</td><td>Player Name</td><td>Name on Tshirt</td><td>Number on Tshirt</td><td>Tshirt Size</td><td>Pant Size</td></tr></thead>';
			
			for($i = 0; $i < $MAX_NUM_TEAM_ROSTER; $i++){
				if(!empty($playerName[$i]) && !empty($tshirtName[$i]) && !empty($tshirtNumber[$i]) && !empty($tshirtSize[$i]) && $pantSize[$i] != "none") {
					$body .= '<tr><td>' . strip_tags($i+1) . '</td><td>' . strip_tags($playerName[$i]) . '</td><td>' . strip_tags(strtoupper($tshirtName[$i])) . '</td><td>' . strip_tags($tshirtNumber[$i]) . '</td><td>' . strip_tags($tshirtSize[$i]) . '</td><td>' . strip_tags($pantSize[$i]) . '</td></tr>';
				}
			}
			
			$body .= '</table><hr />';

			//$mail->IsSMTP();
			$mail->Host = 'host150.hostmonster.com';
			$mail->SetFrom($emailaddress, $from);
			$mail->AddCC('knijjar@yahoo.com');
			$mail->AddCC('lokeshnaicker@gmail.com');
			$mail->AddCC($emailaddress);			
			$mail->AddReplyTo($emailaddress, $from);
			$mail->AddAttachment('http://dallascricket.net/dcl1/images/". strip_tags($tshirt_design_code_1).".jpg', 'selected design');

			$mail->Subject = "Tshirt Order: DCL\n\r";
			$mail->AltBody = "To view the message, please use an HTML compatible email viewer!";
			$mail->MsgHTML($body);

			$address = "dclmgmt@gmail.com";
			$mail->AddAddress($address, "Dallas Cricket League");
			
			if(!$mail->Send()) {
			  echo "Mailer Error: " . $mail->ErrorInfo;
			} else {
			  echo "<h3>Message sent!  Your order has been received.</h3><p>Remember to add our address to your white list, to avoid it being sent to the spam folder.</p>";
			}
			
		}
?>
  </form>
  <hr />
  <div align="center" style="color:#999">UX Design by <a href="www.naickerdesign.com" target="_blank">Naickerdesign.com</a></div>
</div>
</body>
</html>