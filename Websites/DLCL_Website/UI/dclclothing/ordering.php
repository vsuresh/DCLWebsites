<!DOCTYPE html>
<html lang="en">

<head>
	<title>DCL Team Tshirt Ordering</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700,500' rel='stylesheet' type='text/css'>
	<script>
	</script>
</head>
<title>DCL Team Tshirt Ordering</title>
<style>
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
		font-weight: 700;
	}
	
	input {
		font-size: 18px;
	}
	
	select {
		font-size: 13px;
		background-color: #FFE;
	}
	
	.carousel-inner> .item> img,
	.carousel-inner> .item> a> img {
		width: 50%;
		margin: auto;
	}
	
	.note {
		font-size: 12px;
		font-style: normal;
		font-weight: lighter;
		color: #999;
	}
	
	.player-name {
		font-size: 14px;
		font-weight: 700;
		border-bottom-style: 1;
		border-bottom-color: #999;
		width: auto;
	}
	
	.tshirt-name {
		text-transform: uppercase;
		font-size: 14px;
		font-weight: 700;
		background-color: #FFE;
		color: #c30 !important;
		width: auto;
	}
	
	.tshirt-number {
		text-transform: uppercase;
		background-color: #FFE;
		font-size: 14px;
		font-weight: 700;
		color: #c30 !important;
		width: 4em;
	}
	
	.requ {
		background-color: #FFE;
	}
</style>
</head>

<body>
	<div>
		<form id="form1" name="form1" method="post" action="ordering-preview.php" role="form">
			<div class="container-fluid">
				<div align="center"><img src="images/logo-DCL.jpg" width="100" height="100">
					<h1> Team Uniform Ordering</h1>
				</div>
				<h3> Before you start</h3>
				<p>
					<ul>
						<li>Make sure you have all the information required handy. You need information about Tshirt Size, <strong>Name</strong> &amp; <strong>Number</strong> to be printed on back for each team member in your roster.</li>
						<li>Minimum 11 player are required and 36 player are max.</li>
						<li>Contact DCL Management for additional Uniform pricing and delivery estimates.</li>
					</ul>
				</p>
				<h3> Tshirt Design Gallery</h3>
				<p>
					<ul>
						<li>Newly added designs <a href="designgallery-2018.html" target="_blank">2018 Design Gallery</a>
						</li>
						<li>More designs <a href="designgallery.html" target="_blank">Design Gallery</a>
						</li>
					</ul>
				</p>

				<h3>Team Details</h3>
				<div class="form-group">
					<div class="col-md-6 col-xs-12">
						<label for="teamname">Team Name</label>
						<input type="text" class="form-control requ" id="teamname" name="teamname" placeholder="Enter your Team name as registered" required>
						</br>
					</div>


					<div class="col-md-6 col-xs-12">
						<label for="teamdiv">Participating in DCL Division </label>
						<select name="dcl_division" id="dcl_division" class="form-control requ">
							<option value="none" selected="selected">Select</option>
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
							<option value="D">D</option>
							<option value="E">E</option>
							<option value="F">F</option>
							<option value="Youth">Youth</option>
							<option value="Women">Women</option>
							<option value="Others">Others</option>
						</select>

						</br>
						</br>
					</div>
				</div>

				<h3>Team Uniform Design</h3>

				<div class="col-md-6 col-xs-12">
					<p>
						<ul>
							<li><strong>NOTE:</strong> These design are illustrative ONLY. The final color n design may have some difference from the online images. </li>
							<li>As their are operational limitations from colors online (RGB) and final printed fabric (Pantone or CMKY). </li>

						</ul>
					</p>
				</div <div class="form-group">
				<div class="col-md-6 col-xs-12">
					<label for="designcode">Your Selected Design </label>

					<select name="tshirt_design_code_1" id="tshirt_design_code_1" class="form-control requ">
						<option value="none" selected="selected">Select your choice</option>

						<optgroup label="Design 1801">
							<option value="D1801CC1 Navy Blue">						D1801CC1 Navy Blue</option>
							<option value="D1801CC2 Dark Green">					D1801CC2 Dark Green</option>
							<option value="D1801CC3 Orange">						D1801CC3 Orange</option>
							<option value="D1801CC4 Light Blue">					D1801CC4 Light Blue</option>
						</optgroup>
						<optgroup label="Design 1802">
							<option value="D1802CC1 Red+Maroon">					D1802CC1 Red+Maroon</option>
							<option value="D1802CC2 Blue">							D1802CC2 Blue</option>
							<option value="D1802CC3 TurquoiseGreen+Gray">			D1802CC3 TurquoiseGreen+Gray</option>
							<option value="D1802CC4 Yellow+Gray">					D1802CC4 Yellow+Gray</option>
						</optgroup>
						<optgroup label="Design 1803">
							<option value="D1803CC1 Blue+GlowingGreen">				D1803CC1 Blue+GlowingGreen</option>
							<option value="D1803CC2 IndiaBlue">						D1803CC2 IndiaBlue</option>
							<option value="D1803CC3 TurquoiseGreen+GlowingGreen">	D1803CC3 TurquoiseGreen+GlowingGreen</option>
							<option value="D1803CC4 NavyBlue+Yellow">				D1803CC4 NavyBlue+Yellow</option>
						</optgroup>
						<optgroup label="Design 1804">
							<option value="D1804CC1 Red+DarkBlue">					D1804CC1 Red+DarkBlue</option>
							<option value="D1804CC2 Green+Blue">					D1804CC2 Green+Blue</option>
							<option value="D1804CC3 Gray+Purple">					D1804CC3 Gray+Purple</option>
							<option value="D1804CC4 Gray+TurquoiseGreen">			D1804CC4 Gray+TurquoiseGreen</option>
						</optgroup>
						<optgroup label="Design 1805">
							<option value="D1805CC1 Red">							D1805CC1 Red</option>
							<option value="D1805CC2 Blue">							D1805CC2 Blue</option>
							<option value="D1805CC3 Purple">						D1805CC3 Purple</option>
							<option value="D1805CC4 Green">							D1805CC4 Green</option>
						</optgroup>
						<optgroup label="Design 1806">
							<option value="D1806CC1 DarkBlue+Green">				D1806CC1 DarkBlue+Green</option>
							<option value="D1806CC2 LightBlue+Orange">				D1806CC2 LightBlue+Orange</option>
							<option value="D1806CC3 ArmyGreen-GlowingGreen">		D1806CC3 ArmyGreen-GlowingGreen</option>
							<option value="D1806CC4 Red+Blue">						D1806CC4 Red+Blue</option>
						</optgroup>

						<optgroup label="Design 1807">
							<option value="D1807CC1 Camo Cool Blues">				D1807CC1 Camo Cool Blues</option>
							<option value="D1807CC2 Camo Warm Reds">				D1807CC2 Camo Warm Reds </option>
							<option value="D1807CC3 Camo Forest Beige">				D1807CC3 Camo Forest Beige </option>
							<option value="D1807CC4 Camo Nature Green">				D1807CC4 Camo Nature Green </option>
						</optgroup>
						<optgroup label="Design 1808">
							<option value="D1808CC1 Aussie Green+Yellow">			D1808CC1 Aussie Green+Yellow</option>
							<option value="D1808CC2 Brilliant Blue+Green">			D1808CC2 Brilliant Blue+Green</option>
							<option value="D1808CC3 Gray+Purple">					D1808CC3 Gray+Purple</option>
							<option value="D1808CC4 Gray+Blue">						D1808CC4 Gray+Blue</option>
						</optgroup>
						<optgroup label="Design 1809">
							<option value="D1809CC1 Orange+Gray Lines">				D1809CC1 Orange+Gray Lines</option>
							<option value="D1809CC2 DarkBlue+Green Lines">			D1809CC2 DarkBlue+Green Lines</option>
							<option value="D1809CC3 Black+Blue Lines">				D1809CC3 Black+Blue Lines</option>
							<option value="D1809CC4 Texas Red+Blue Lines">			D1809CC4 Texas Red+Blue Lines</option>
						</optgroup>
						<optgroup label="Design 1810">
							<option value="D1810CC1 Gray with India Blue">			D1810CC1 Gray with India Blue</option>
							<option value="D1810CC2 Gray with WestIndies Red">		D1810CC2 Gray with WestIndies Red</option>
							<option value="D1810CC3 Gray with Ocean Blue">			D1810CC3 Gray with Ocean Blue</option>
							<option value="D1810CC4 Gray with Aussie Yellow">		D1810CC4 Gray with Aussie Yellow</option>
						</optgroup>

						<optgroup label="Design 1811">
							<option value="D1811CC1 DCL Waves Blues">				D1811CC1 DCL Waves Blues</option>
							<option value="D1811CC2 DCL Waves with Blue+Green">		D1811CC2 DCL Waves with Blue+Green</option>
							<option value="D1811CC3 DCL Waves with Gray+Mustard">	D1811CC3 DCL Waves with Gray+Mustard</option>
							<option value="D1811CC4 DCL Waves with Seablue+Blue">	D1811CC4 DCL Waves with Seablue+Blue</option>
						</optgroup>
						<optgroup label="Design 1812">
							<option value="D1812CC1 Superhero Blues">				D1812CC1 Superhero Blues</option>
							<option value="D1812CC2 Superhero Gray+Pink">			D1812CC2 Superhero Gray+Pink</option>
							<option value="D1812CC3 Superhero Gray+TBlue">			D1812CC3 Superhero Gray+TBlue</option>
							<option value="D1812CC4 Superhero DullBlue">			D1812CC4 Superhero DullBlue</option>
						</optgroup>


						<optgroup label="Design 1">
							<option value="D1CC1 Green">							D1CC1 Green</option>
							<option value="D1CC2 Red+Blu">							D1CC2 Red+Blue</option>
							<option value="D1CC3 Blue+Orange">						D1CC3 Blue+Orange</option>
							<option value="D1CC4 Red+Maroon">						D1CC4 Red+Maroon</option>
							<option value="D1CC5 Black+Orange">						D1CC5 Black+Orange</option>
						</optgroup>
						<optgroup label="Design 2">
							<option value="D2CC1 Orang">							D2CC1 Orange</option>
							<option value="D2CC2 Blue">								D2CC2 Blue</option>
							<option value="D2CC3 Blue+Red">							D2CC3 Blue+Red</option>
							<option value="D2CC4 Green">							D2CC4 Green</option>
							<option value="D2CC5 Green+Red">						D2CC5 Green+Red</option>
						</optgroup>
						<optgroup label="Design3">
							<option value="D3CC1 Blues">							D3CC1 Blues</option>
							<option value="D3CC2 Green+Black">						D3CC2 Green+Black</option>
							<option value="D3CC3 DarkBlue+Black">					D3CC3 DarkBlue+Black</option>
							<option value="D3CC4 Green+Red">						D3CC4 Green+Red</option>
							<option value="D3CC5 Pink+Black">						D3CC5 Pink+Black</option>
						</optgroup>
						<optgroup label="Design 4">
							<option value="D4CC1 Maroon+Orange">					D4CC1 Maroon+Orange</option>
							<option value="D4CC2 Green+Yellow">						D4CC2 Green+Yellow</option>
							<option value="D4CC3 Blue">								D4CC3 Blue</option>
							<option value="D4CC4 Yellow+Green">						D4CC4 Yellow+Green</option>
							<option value="D4CC5 TurquoiseBlue+Orange">				D4CC5 TurquoiseBlue+Orange</option>
						</optgroup>
						<optgroup label="Design 5">
							<option value="D5CC1 Purple">							D5CC1 Purple</option>
							<option value="D5CC2 Orange+Yellow">					D5CC2 Orange+Yellow</option>
							<option value="D5CC3 Green">							D5CC3 Green</option>
							<option value="D5CC4 Light+DarkBlue">					D5CC4 Light+DarkBlue</option>
							<option value="D5CC5 Red+Black">						D5CC5 Red+Black</option>
						</optgroup>
						<optgroup label="Design 6">
							<option value="D6CC1 Gray+Orange">						D6CC1 Gray+Orange</option>
							<option value="D6CC2 Green+Yellow">						D6CC2 Green+Yellow</option>
							<option value="D6CC3 HotGreen+Black">					D6CC3 HotGreen+Black</option>
							<option value="D6CC4 Blue">								D6CC4 Blue</option>
							<option value="D6CC5 TurquoiseBlue+Gray">				D6CC5 TurquoiseBlue+Gray</option>
						</optgroup>
						<optgroup label="Design 7">
							<option value="D7CC1 RoyalBlue+Yellow">					D7CC1 RoyalBlue+Yellow</option>
							<option value="D7CC2 Blue+Red">							D7CC2 Blue+Red</option>
							<option value="D7CC3 HotGreen+Gray">					D7CC3 HotGreen+Gray</option>
							<option value="D7CC4 BrickOrange+Gray">					D7CC4 BrickOrange+Gray</option>
							<option value="D7CC5 TurquoiseBlue+Gray">				D7CC5 TurquoiseBlue+Gray</option>
						</optgroup>
						<optgroup label="Design 8">
							<option value="D8CC1 Red+Blue">							D8CC1 Red+Blue</option>
							<option value="D8CC2 Blue+Yellow">						D8CC2 Blue+Yellow</option>
							<option value="D8CC3 Green">							D8CC3 Green</option>
							<option value="D8CC4 Blue+Black">						D8CC4 Blue+Black</option>
							<option value="D8CC5 Orange+Blue">						D8CC5 Orange+Blue</option>
						</optgroup>
						<optgroup label="Design 9">
							<option value="D9CC1 Blue">								D9CC1 Blue</option>
							<option value="D9CC2 DarkBlue">							D9CC2 DarkBlue</option>
							<option value="D9CC3 LightBLue">						D9CC3 LightBLue</option>
							<option value="D9CC4 Blue">								D9CC4 Blue</option>
							<option value="D9CC5 Sun">								D9CC5 Sun</option>
							<option value="D9CC6 DarkBlue">							D9CC6 DarkBlue</option>
						</optgroup>
						<optgroup label="Design 10">
							<option value="D10CC1 DarkGreen Dots">					D10CC1 DarkGreen Dots</option>
							<option value="D10CC2 Green Pak">						D10CC2 Green Pak</option>
							<option value="D10CC3 LightGreen Bars">					D10CC3 LightGreen Bars</option>
							<option value="D10CC4 Green Lines">						D10CC4 Green Lines</option>
							<option value="D10CC5 DarkGreen Stars">					D10CC5 DarkGreen Stars</option>
							<option value="D10CC6 LightGreen Lines">				D10CC6 LightGreen Lines</option>
						</optgroup>
						<optgroup label="Design 11">
							<option value="D11CC1 Black Texas Bull Yellow">			D11CC1 Black Texas Bull Yellow</option>
							<option value="D11CC2 Black Texas Bull Blue">			D11CC2 Black Texas Bull Blue</option>
							<option value="D11CC3 Black Texas Bull Orange">			D11CC3 Black Texas Bull Orange</option>
							<option value="D11CC4 Black Texas Bull HotGreen">		D11CC4 Black Texas Bull HotGreen</option>
							<option value="D11CC5 Black Texas Bull Maroon">			D11CC5 Black Texas Bull Maroon</option>
						</optgroup>
						<optgroup label="Design 12">
							<option value="D12CC1 Cricket Figure Maroon">			D12CC1 Cricket Figure Maroon</option>
							<option value="D12CC2 Cricket Figure Dark Blue">		D12CC2 Cricket Figure Dark Blue</option>
							<option value="D12CC3 Cricket Figure Green Pak">		D12CC3 Cricket Figure Green Pak</option>
							<option value="D12CC4 Cricket Figure Blue">				D12CC4 Cricket Figure Blue</option>
							<option value="D12CC5 Cricket Figure Brown">			D12CC5 Cricket Figure Brown</option>
						</optgroup>



					</select>

				</div>
			</div>






			<h3>Team Roster &amp; Uniform Order</h3>
			<h4> (Minimum of 11 player required)</h4>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
						<td><img src="images/ico-tshirt-name.png" width="40%" height="40%">
						</td>
						<td><img src="images/ico-tshirt-number.png" width="40%" height="40%">
						</td>
						<td><img src="images/ico-tshirt.png" width="40%" height="40%">
						</td>
						<td><img src="images/ico-pant.png" width="40%" height="40%">
						</td>
					</tr>
					<tr>
						<th>Roster
							<p class="note">#</p>
						</th>
						<th>Player Name
							<p class="note">Non Printing field</p>
						</th>
						<th>Name on Tshirt
							<p class="note">10 alphabet char max</p>
						</th>
						<th>Number on Tshirt
							<p class="note">2 numeric char max</p>
						</th>
						<th>Tshirt (US) Size
							<p class="note"><a href="images/tsizing.jpg" target="_blank">Sizing Guide</a>
							</p>
						</th>
						<th>Pant (US) Size
							<p class="note"><a href="images/psizing.jpg" target="_blank">Sizing Guide</a>
							</p>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>e.g.</td>
						<td>Sachin Tendulkar</td>
						<td>TENDULKAR</td>
						<td>10</td>
						<td>Men M</td>
						<td>Men S</td>
					</tr>
					<?php
					for ( $i = 1; $i <= 36; $i++ ) {
						?>
					<tr>
						<td>
							<? echo $i; ?>
						</td>
						<td><input name="playerName[]" type="text" class="form-control requ"/>
						</td>
						<td><input name="tshirtName[]" type="text" class="form-control tshirt-name" size="14" maxlength="10" placeholder="10 chars" on keyup="javascript:this.value=this.value.toUpperCase();"/>
						</td>
						<td><input name="tshirtNumber[]" type="text" class="form-control tshirt-number" size="1" maxlength="2" placeholder="00"/>
						</td>
						<td>
							<select name="tshirtSize[]" class="form-control requ" style="color:#c30 !important;">
								<option value="none" selected="selected">Select</option>
								<optgroup label="Men">
									<option value="M-S">Men S</option>
									<option value="M-M">Men M</option>
									<option value="M-L">Men L</option>
									<option value="M-XL">Men XL</option>
									<option value="M-XXL">Men XXL</option>
								</optgroup>
								<optgroup label="Women">
									<option value="W-XS">Women XS</option>
									<option value="W-S">Women S</option>
									<option value="W-M">Women M</option>
									<option value="W-L">Women L</option>
									<option value="W-XL">Women XL</option>
									<option value="W-XXL">Women XXL</option>
								</optgroup>
								<optgroup label="Youth">
									<option value="Y-XS">Youth XS</option>
									<option value="Y-S">Youth S</option>
									<option value="Y-M">Youth M</option>
									<option value="Y-L">Youth L</option>
									<option value="Y-XL">Youth XL</option>
								</optgroup>
							</select>
						</td>
						<td>
							<select name="pantSize[]" class="form-control requ" style="color:#c30 !important;">
								<option value="none" selected="selected">Select</option>
								<optgroup label="Men">
									<option value="M-S">Men S</option>
									<option value="M-M">Men M</option>
									<option value="M-L">Men L</option>
									<option value="M-XL">Men XL</option>
									<option value="M-XXL">Men XXL</option>
								</optgroup>
								<optgroup label="Women">
									<option value="W-XS">Women XS</option>
									<option value="W-S">Women S</option>
									<option value="W-M">Women M</option>
									<option value="W-L">Women L</option>
									<option value="W-XL">Women XL</option>
									<option value="W-XXL">Women XXL</option>
								</optgroup>
								<optgroup label="Youth">
									<option value="Y-XS">Youth XS</option>
									<option value="Y-S">Youth S</option>
									<option value="Y-M">Youth M</option>
									<option value="Y-L">Youth L</option>
									<option value="Y-XL">Youth XL</option>
								</optgroup>
							</select>
						</td>
					</tr>
					<? 
						} 
					?>
				</tbody>
			</table>


			<p>
				<h3>Team Representative Details</h3>
				<p>Kindly provide contact details, in case we need to contact you.</p>


				<div class="form-group">

					<div class="col-md-4 col-xs-12">
						<label for="teamrep_name">Submitted by</label>
						<input id="teamrep_name" name="teamrep_name" type="text" class="form-control requ" required>

					</div>
					<div class="col-md-5 col-xs-12">
						<label for="teamrep_email">Your Email</label>
						<input id="teamrep_email" name="teamrep_email" type="email" class="form-control requ" required>
					</div>
					<div class="col-md-3 col-xs-12">
						<label for="teamrep_phone">Your Phone</label>
						<input id="teamrep_phone" name="teamrep_phone" type="tel" class="form-control requ" required>
					</div>
				</div>
			</p>

			</br>
			</br>

			<h3>Review &amp; Confirm</h3>
			<p>Please re-check for spelling and Tshirt sizing before submitting.</p>
			<div class="checkbox">
				<label>
        <input type="checkbox" name="acknowledge" id="acknowledge">
					<strong>Yes</strong>, everything looks good. </br>
       I understand - the final color and design may have some difference from the online images. </br> 
      Also acknowledge, their are operational limitations from colors online (RGB) and final printed fabric (Pantone or CMKY). </label>
			




			</div>

			<div align="center">
				</br>
				</br>
				<input name="Submit" type="submit" value="Preview Your Order" id="submit" class="btn-lg btn-primary btn-block">
				</br>
				</br>
			</div>
		</form>
		<div align="center" style="color:#999">UX Design by <a href="http://www.naickerdesign.com" target="_blank">Naickerdesign.com</a>
		</div>
	</div>
</body>

</html>