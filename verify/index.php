<?php
/*
	Copyright © 2019 Anonymous

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU Affero General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Affero General Public License for more details.

	You should have received a copy of the GNU Affero General Public License
	along with this program. If not, see <https://www.gnu.org/licenses/>.
*/

$mysqli = new mysqli("localhost", "username", "password", "glat");
if ($mysqli->connect_errno) {
    exit("LAT_ERROR_SERVER_FAILURE");
}


// Incomplete data

if (! isset($_GET["channel"])) {
	exit("Missing channel.");
}

if (strcmp($_GET["channel"], "OEM") and ! isset($_GET["product_key"])) {
	exit("Missing product key.");
} 

if (strcmp($_GET["channel"], "volume") and ! isset($_GET["hwid"])) {
	exit("Unknown hardware hash.");
} 

// Checking license

if (! strcmp($_GET["channel"], "OEM")) {
	$stmt = $mysqli->prepare("SELECT * FROM oem_licenses WHERE hwid = ?");
	$stmt->bind_param('s', $_GET["hwid"]);

	$stmt->execute();
	$result = $stmt->get_result();

	if ($result->num_rows > 0) {
		exit("OK"); // OEM key found
	} else {
		exit("FAIL"); // OEM key not found
	}
} elseif (! strcmp($_GET["channel"], "retail")) {
	$stmt = $mysqli->prepare("SELECT hwid, blacklisted FROM retail_licenses WHERE product_key = ?");
	$stmt->bind_param('s', $_GET["product_key"]);

	$stmt->execute();
	$result = $stmt->get_result();

	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
			if ($row["blacklisted"]) {
				exit("FAIL"); // product key blacklisted
			} elseif ( $row["hwid"] and strcmp($_GET["hwid"], $row["hwid"])) {
				exit("FAIL"); // hardware ID mismatch
			}
		}
		if (isset($_GET["delete"])) {
			if ($_GET["delete"] == 1) {
				$stmt = $mysqli->prepare("UPDATE retail_licenses SET hwid = NULL WHERE product_key = ?");
				$stmt->bind_param('s', $_GET["product_key"]);
				$stmt->execute();
				exit("Hardware ID deleted.");
			}
		}
				
		$stmt = $mysqli->prepare("UPDATE retail_licenses SET hwid = ? WHERE product_key = ?");
		$stmt->bind_param('ss', $_GET["hwid"], $_GET["product_key"]);
		$stmt->execute();
		exit("OK"); // product key valid
	} else {
		exit("FAIL"); // product key invalid
	}
} elseif (! strcmp($_GET["channel"], "volume")) {
	$stmt = $mysqli->prepare("SELECT blacklisted FROM volume_licenses WHERE product_key = ?");
	$stmt->bind_param('s', $_GET["product_key"]);

	$stmt->execute();
	$result = $stmt->get_result();

	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
			if ($row["blacklisted"]) {
				exit("FAIL"); // product key blacklisted
			}
		}
		exit("OK"); // product key valid
	} else {
		exit("FAIL"); // product key invalid
	}
} else {
	exit("FAIL"); // Unknown channel
}
?>
