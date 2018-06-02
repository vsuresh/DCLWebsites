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
	font-size: 14px;
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
.upper {
	text-transform: uppercase;
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
 		<div align="center"><img src="images/logo-DCL.jpg" width="100" height="100"><h4> 2017 Team Uniform</h4><h1>Order Preview</h1></div>
<?php
      error_reporting(0);
      
      $from = trim($_REQUEST['teamrep_name']);
      $emailaddress = trim($_REQUEST['teamrep_email']);
	  
      $teamName = trim($_REQUEST['teamname']);	
      $dclDivision = trim($_REQUEST['dcl_division']);	
      $tshirtDesignFirstChoice = trim($_REQUEST['tshirt_design_code_1']);	
      //$tshirtDesignSecondChoice = trim($_REQUEST['tshirt_design_code_2']);	
      //$tshirtDesignThirdChoice = trim($_REQUEST['tshirt_design_code_3']);
	  
	  $playerName = $_REQUEST['playerName'];
	  $tshirtName = $_REQUEST['tshirtName'];
	  $tshirtNumber = $_REQUEST['tshirtNumber'];
	  $tshirtSize = $_REQUEST['tshirtSize'];
	  $pantSize = $_REQUEST['pantSize'];
	 
      $teamPhone = trim($_REQUEST['teamrep_phone']);	
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
			$errors[] = 'T-shirt Design Choice';
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
			echo '<h2 style=color:#F00">Oops! There is a problem with your form input...</h2>';
			echo '<p><strong>Please click the Back Button</strong> and correct the following error(s):</p><ul>';
			
			foreach ($errors as $e) {
				echo "<li>Please enter a valid $e.</li>\n";
			}

			echo '</ul>';
?>
			<div align="center"><button class="btn" style="margin:40px 0 80px 0" onclick="window.history.back(); return false;">&lt; Back</button></div>
<?php
		} else {
?>
			<h3>Team Details &amp; Design Choice</h3>
      <div align="right"><p class="note"><a href="#" onclick="window.history.back(); return false;">EDIT</a></p></div>
      <table class="table table-striped">
        <tbody>
          <tr><th>Team Name</th> <td><?php echo $teamName; ?></td></tr>
          <tr><th>Participating Division</th><td><?php echo $dclDivision; ?></td></tr>
          <tr><th>Design choice</th><td><?php echo $tshirtDesignFirstChoice; ?></td></tr>
          <!--<tr><th>2nd Design choice</th><td><?php echo $tshirtDesignSecondChoice; ?></td></tr>
          <tr><th>3rd Design choice</th><td><?php echo $tshirtDesignThirdChoice; ?></td></tr>-->
        </tbody>
      </table>
  
    
    
    <h3>Team Roster &amp; Uniform Order Request</h3>
    <div align="right">
      <p class="note"><a href="#" onclick="window.history.back(); return false;">EDIT</a></p>
    </div>
    <table class="table table-striped">
      <thead><tr><th>Roster</th><th>Player Name</th><th>Name on T-Shirt</th><th>Number on T-Shirt</th><th>T-Shirt Size</th><th>Pant Size</th></tr></thead>
      <tbody>
<?php
	for($i = 0; $i < $MAX_NUM_TEAM_ROSTER; $i++){
		if(!empty($playerName[$i]) && !empty($tshirtName[$i]) && !empty($tshirtNumber[$i]) && !empty($tshirtSize[$i]) && $pantSize[$i] != "none") {
?>
			<tr>
				<td class="lowlight"><?php echo $i+1; ?></td>
				<td class="lowlight"><?php echo $playerName[$i]; ?></td>
				<td class="highlight upper"><?php echo strtoupper($tshirtName[$i]); ?></td>
				<td class="highlight"><?php echo $tshirtNumber[$i]; ?></td>
				<td class="highlight"><?php echo $tshirtSize[$i]; ?></td>
                <td class="highlight"><?php echo $pantSize[$i]; ?></td>
			</tr>
<?php
		}
	}
?>		
      </tbody>
    </table>
    
    
    <h3>Team Representative Details</h3>
    <div align="right"><p class="note"><a href="#" onclick="window.history.back(); return false;">EDIT</a></p></div>
    <table class="table table-striped">
      <tbody>
        <tr><th>Submitted by</th><td><?php echo $from; ?></td></tr>
        <tr><th>Email</th><td><?php echo $emailaddress; ?></td></tr>
        <tr><th>Phone</th><td><?php echo $teamPhone; ?></td></tr>
      </tbody>
    </table>
    
    
    <h3>Order Reviewed &amp; Confirmed?</h3>
    <h5>Kindly check the name, spellings, and sizes</h5>
    <?php /*?><p><?php echo isset($acknowledge) ? "Yes" : "No"; ?><p><?php */?>
	
    <div align="center"><input name="Submit" type="submit" value="Confirm Order" id="submit" class="btn btn-default" style="margin:40px 0 80px 0"></div>
    
	<input type="hidden" name="teamName" value="<?php echo $teamName; ?>">
	<input type="hidden" name="dclDivision" value="<?php echo $dclDivision; ?>">
	<input type="hidden" name="tshirtDesignFirstChoice" value="<?php echo $tshirtDesignFirstChoice; ?>">
	<input type="hidden" name="tshirtDesignSecondChoice" value="<?php echo $tshirtDesignSecondChoice; ?>">
	<input type="hidden" name="tshirtDesignThirdChoice" value="<?php echo $tshirtDesignThirdChoice; ?>">
	<input type="hidden" name="from" value="<?php echo $from; ?>">
	<input type="hidden" name="emailaddress" value="<?php echo $emailaddress; ?>">
	<input type="hidden" name="teamPhone" value="<?php echo $teamPhone; ?>">
	<input type="hidden" name="acknowledge" value="<?php echo $acknowledge; ?>">
	
<?php
	for($i = 0; $i < $MAX_NUM_TEAM_ROSTER; $i++){
		if(!empty($playerName[$i])) {
?>
	<input type="hidden" name="playerName[]" value="<?php echo $playerName[$i]; ?>">
<?php
		}
	}
?>

<?php
	for($i = 0; $i < $MAX_NUM_TEAM_ROSTER; $i++){
		if(!empty($tshirtName[$i])) {
?>
			<input type="hidden" name="tshirtName[]" value="<?php echo  strtoupper($tshirtName[$i]); ?>">
<?php
		}
	}
?>

<?php
	for($i = 0; $i < $MAX_NUM_TEAM_ROSTER; $i++){
		if(!empty($tshirtNumber[$i])) {
?>
			<input type="hidden" name="tshirtNumber[]" value="<?php echo $tshirtNumber[$i]; ?>">
<?php
		}
	}
?>

<?php
	for($i = 0; $i < $MAX_NUM_TEAM_ROSTER; $i++){
		if($tshirtSize[$i] != "none") {
?>
			<input type="hidden" name="tshirtSize[]" value="<?php echo $tshirtSize[$i]; ?>">
<?php
		}
	}
?>

<?php
	for($i = 0; $i < $MAX_NUM_TEAM_ROSTER; $i++){
		if($pantSize[$i] != "none") {
?>
			<input type="hidden" name="pantSize[]" value="<?php echo $pantSize[$i]; ?>">
<?php
		}
	}
?>

<?php
		}
?>      
  </form>
  <div align="center" style="color:#999">UX Design by <a href="www.naickerdesign.com" target="_blank">Naickerdesign.com</a></div>
</div>
</body>
</html>
