#!/bin/bash
###################################################################################
#                            ULTIMATE SUPPORT TOOL v1.0                           #
#                                   WRITTEN  BY                                   #
#                       GEORGI GEORGIEV DIMITROV (GGD07.com)                      #
#                           FOR VARIOUS WEB APPLICATIONS                          #
#                                                                                 #
#                           CONTACT: GGD07COM@GMAIL.COM                           #
#                                                                                 #
###################################################################################
# Ultimate Support Tools written to be used to automate work as Technical Support #
#    Copyright (C) 2015  Georgi Georgiev Dimitrov (Ggd07.com)                     #
#                                                                                 #
#    This program is free software: you can redistribute it and/or modify         #
#    it under the terms of the GNU General Public License as published by         #
#    the Free Software Foundation, either version 3 of the License, or            #
#    (at your option) any later version.                                          #
#                                                                                 #
#    This program is distributed in the hope that it will be useful,              #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of               #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                #
#    GNU General Public License for more details.                                 #
#                                                                                 #
#    You should have received a copy of the GNU General Public License            #
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.        #
###################################################################################

# Setup Colors
BLUE="\e[34m"; LBLUE="\e[94m"; RED="\e[31m"; LRED="\e[91m"; GREEN="\e[32m"; LGREEN="\e[92m"; YELLOW="\e[33m"; LYELLOW="\e[93m"; DCOLOR="\e[39m";

# Initial Output
echo " ";
echo -e "$BLUE#####################################################################";
echo -e "$BLUE#$RED                     ULTIMATE SUPPORT TOOL v1.0$BLUE                    #";
echo -e "$BLUE#$RED                                BY$BLUE                                 #";
echo -e "$BLUE#$RED                GEORGI GEORGIEV DIMITROV (GGD07.COM)$BLUE               #";
echo -e "$BLUE#####################################################################$DCOLOR";
echo " ";

# Gathering Functions
function findApps {
	case $1 in
		wp)
			find=$(find "$PWD" -type f -name "wp-config.php" | wc -l);
		;;
		jm)
			find=$(find "$PWD" -type f -name "configuration.php" | wc -l);
		;;
		mg)
			find=$(find "$PWD" -type f -name "local.xml" | wc -l);
		;;
		dp)
			find=$(find "$PWD" -type f -name "default.settings.php" | wc -l);
		;;
		pr)
			find=$(find "$PWD" -type f -name "settings.inc.php" | wc -l);
		;;
	esac
	echo "$find";
}

# Main Functions
function isEmpty {
	back=$1;
	if [ -z "$1" ];
		then
			echo "$RED""ERROR!$DCOLOR";
		else
			echo "$back";
	fi	
}
function checkMultisite {
	if [ ! -z "$1" ];
		then
			echo "MULTSITE DETECTED!";
	fi
}
function checkApplications {
	totalWP=$(findApps wp);
	totalJM=$(findApps jm);
	totalMG=$(findApps mg);
	totalDP=$(findApps dp);
	totalPR=$(findApps pr);
    totalApps=$((totalWP+totalJM+totalMG+totalDP+totalPR));
    echo -e "$BLUE#####################################################################";
    echo -e "$BLUE            $YELLOW      TOTAL WEB APPLICATIONS FOUND: $GREEN$totalApps                 $BLUE";
    echo -e "$BLUE#####################################################################$DCOLOR";
	echo -e " ";
    echo -e "              $YELLOW TOTAL$GREEN WORDPRESS$YELLOW APPLICATIONS FOUND: $GREEN$totalWP$DCOLOR ";
	echo -e " ";
	for(( i=1; i<totalWP+1; i++ ))
            do
                wpDir[$i]=$(find "$PWD" -type f -name "wp-config.php" | sed -e 's/wp-config.php//g' | sed -n "$i"p);
				wpVersion[$i]=$(find "${wpDir[i]}" -type f -name "version.php" -print0 | xargs -0 grep 'wp_version =' | awk -F"'" '{print $2}');
	echo -e "$LYELLOW""WordPress #$GREEN$i$LYELLOW Version$LYELLOW"":""$LGREEN ${wpVersion[$i]} $LYELLOW""PATH: $LGREEN${wpDir[$i]}$DCOLOR";
			done;
	echo -e " ";
    echo -e "              $YELLOW TOTAL$GREEN JOOMLA$YELLOW APPLICATIONS FOUND: $GREEN$totalJM$DCOLOR ";
    echo -e " ";
	for(( i=1; i<totalJM+1; i++ ))
            do
                jmDir[$i]=$(find "$PWD" -type f -name "configuration.php" | sed -e 's/configuration.php//g' | sed -n "$i"p);
				jmVersion[$i]=$(find "${jmDir[i]}libraries/cms/version/" -type f -name "version.php" -print0 | xargs -0 grep '$RELEASE =' | awk -F"'" '{print $2}');
				echo -e "$LYELLOW""Joomla #$GREEN$i$LYELLOW Version$LYELLOW"":""$LGREEN ${jmVersion[$i]} $LYELLOW""PATH: $LGREEN${jmDir[$i]}$DCOLOR";
			done;
	echo -e " ";
    echo -e "              $YELLOW TOTAL$GREEN MAGENTO$YELLOW APPLICATIONS FOUND: $GREEN$totalMG$DCOLOR ";
    echo -e " ";
	for(( i=1; i<totalMG+1; i++ ))
            do
                mgDir[$i]=$(find "$PWD" -type f -name "local.xml" | sed -e 's/app\/etc\/local.xml//g' | sed -n "$i"p);
                mgVera[$i]=$(find "${mgDir[i]}app/" -type f -name "Mage.php" -print0 | xargs -0 grep -A6 'static function getVersionInfo' | sed -n 4p | awk -F"'" '{print $4}');
                mgVerb[$i]=$(find "${mgDir[i]}app/" -type f -name "Mage.php" -print0 | xargs -0 grep -A6 'static function getVersionInfo' | sed -n 5p | awk -F"'" '{print $4}');
                mgVerc[$i]=$(find "${mgDir[i]}app/" -type f -name "Mage.php" -print0 | xargs -0 grep -A6 'static function getVersionInfo' | sed -n 6p | awk -F"'" '{print $4}');
                mgVerd[$i]=$(find "${mgDir[i]}app/" -type f -name "Mage.php" -print0 | xargs -0 grep -A6 'static function getVersionInfo' | sed -n 7p | awk -F"'" '{print $4}');
				echo -e "$LYELLOW""Magento #$GREEN$i$LYELLOW Version$LYELLOW"":""$LGREEN ${mgVera[i]}.${mgVerb[i]}.${mgVerc[i]}.${mgVerd[i]} $LYELLOW""PATH: $LGREEN${mgDir[$i]}$DCOLOR";
			done;
	echo -e " ";
    echo -e "              $YELLOW TOTAL$GREEN DRUPAL$YELLOW APPLICATIONS FOUND: $GREEN$totalDP$DCOLOR ";
    echo -e " ";
	for(( i=1; i<totalDP+1; i++ ))
            do
                dpDir[$i]=$(find "$PWD" -type f -name "default.settings.php" | sed -e 's/sites\/default\/default.settings.php//g' | sed -n "$i"p);
				dpVer[$i]=$(find "${dpDir[i]}includes/" -type f -name "bootstrap.inc" -print0 | xargs -0 grep "VERSION" | head -n1 | awk -F"'" '{print $4}');
				echo -e "$LYELLOW""Drupal #$GREEN$i$LYELLOW Version$LYELLOW"":""$LGREEN ${dpVer[$i]} $LYELLOW""PATH: $LGREEN${dpDir[$i]}$DCOLOR";
			done;
	echo -e " ";
    echo -e "              $YELLOW TOTAL$GREEN PRESTASHOP$YELLOW APPLICATIONS FOUND: $GREEN$totalPR$DCOLOR ";
    echo -e " ";
	for(( i=1; i<totalPR+1; i++ ))
            do
                prDir[$i]=$(find "$PWD" -type f -name "settings.inc.php" | sed -e 's/config\/settings.inc.php//g' | sed -n "$i"p);
				prVersion[$i]=$(find "${prDir[i]}" -type f -name "settings.inc.php" -print0 | xargs -0 grep 'PS_VERSION' | sed -n 2p | awk -F"'" '{print $4}');
				echo -e "$LYELLOW""PrestaShop #$GREEN$i$LYELLOW Version$LYELLOW"":""$LGREEN ${prVersion[$i]} $LYELLOW""PATH: $LGREEN${prDir[$i]}$DCOLOR";
			done;
	echo -e " ";
	echo -e " .. Done .. ";
	echo -e " ";
}
function checkPermissions {
	if [ -z "$1" ];
		then
			echo "$GREEN OKAY!";
		else
			echo "$RED NOT OKAY!";
	fi
}
function checkWordPress {
	wpInstalls=$(findApps wp);
	if [ "$wpInstalls" != 0 ];
		then
			echo -e "$BLUE#####################################################################";
			echo -e "$BLUE#            $YELLOW      WORDPRESS$RED APPLICATIONS FOUND: $GREEN$wpInstalls                  $BLUE#";
			echo -e "$BLUE#####################################################################$DCOLOR";
			for(( i=1; i<wpInstalls+1; i++ ))
			do
				wpDir[$i]=$(find "$PWD" -type f -name "wp-config.php" | sed -e 's/wp-config.php//g' | sed -n "$i"p);
				wpDatabase[$i]=$(find "$PWD" -type f -name "wp-config.php" -print0 | xargs -0 grep 'DB_NAME' | awk -F"'" '{print $4}' | sed -n "$i"p);
				wpUser[$i]=$(find "$PWD" -type f -name "wp-config.php" -print0 | xargs -0 grep 'DB_USER' | awk -F"'" '{print $4}' | sed -n "$i"p);
				wpPassword[$i]=$(find "$PWD" -type f -name "wp-config.php" -print0 | xargs -0 grep 'DB_PASSWORD' | awk -F"'" '{print $4}' | sed -n "$i"p);
				wpHost[$i]=$(find "$PWD" -type f -name "wp-config.php" -print0 | xargs -0 grep 'DB_HOST' | awk -F"'" '{print $4}' | sed -n "$i"p);
				wpVersion[$i]=$(find "${wpDir[i]}" -type f -name "version.php" -print0 | xargs -0 grep 'wp_version =' | awk -F"'" '{print $2}');
				wpMultisite[$i]=$(find "${wpDir[i]}" -type f -name "wp-config.php" -print0 | xargs -0 grep 'MULTISITE');
				wpMultisite[$i]=$(checkMultisite "${wpMultisite[i]}");
				wpPermissions[$i]=$(find "${wpDir[i]}" -type f ! -perm 0644);
				wpPermissions[$i]=$(checkPermissions "${wpPermissions[i]}");
				mysql -B -u"${wpUser[i]}" -p"${wpPassword[i]}" "${wpDatabase[i]}" --skip-column-names -e "EXIT" 2>/dev/null;
				if [ $? == 0 ];
					then
						wpConnectivity="$GREEN OKAY!$DCOLOR";
						wpAnalyze=1;
						wpTable=$(mysql -B -u"${wpUser[i]}" -p"${wpPassword[i]}" "${wpDatabase[i]}" -s -e "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE '%\_options'" | sed -n 1p);
						wpUsersTable=$(mysql -B -u"${wpUser[i]}" -p"${wpPassword[i]}" "${wpDatabase[i]}" -s -e "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE '%\_users'" | sed -n 1p);
						wpSiteurl=$(mysql -B -u"${wpUser[i]}" -p"${wpPassword[i]}" "${wpDatabase[i]}" -s -e "SELECT option_value FROM $wpTable WHERE option_name = 'siteurl'" | sed -n 1p); 
						wpHome=$(mysql -B -u"${wpUser[i]}" -p"${wpPassword[i]}" "${wpDatabase[i]}" -s -e "SELECT option_value FROM $wpTable WHERE option_name = 'home'" | sed -n 1p);
						wpSiteUrlHTTP=$(curl -I "$wpSiteurl" 2>/dev/null | grep HTTP);
						wpHomeHTTP=$(curl -I "$wpHome" 2>/dev/null | grep HTTP);
						wpAdminName=$(mysql -B -u"${wpUser[i]}" -p"${wpPassword[i]}" "${wpDatabase[i]}" -s -e "SELECT user_login FROM $wpUsersTable WHERE ID = 1" | sed -n 1p);
						wpAdminPass=$(mysql -B -u"${wpUser[i]}" -p"${wpPassword[i]}" "${wpDatabase[i]}" -s -e "SELECT user_pass FROM $wpUsersTable WHERE user_login = '$wpAdminName'");
					else
						wpConnectivity="$RED ERROR!$DCOLOR";
				fi
				echo -e "$BLUE#       $RED          $YELLOW     WORDPRESS$RED APPLICATION: $GREEN#$i$BLUE                    #";
				echo -e "$BLUE#            $RED              VERSION: $GREEN${wpVersion[i]}$BLUE                           #";
				echo -e "$BLUE#####################################################################$DCOLOR";
				echo -e " ";
				echo -e "$LRED ABSOLUTE PATH:$YELLOW ${wpDir[i]}";
				echo -e "$LRED DATABASE NAME:$LGREEN ${wpDatabase[i]}";
				echo -e "$LRED DATABASE USER:$LGREEN ${wpUser[i]}";
				echo -e "$LRED DATABASE PASS:$GREEN ${wpPassword[i]}";
				echo -e "$LRED DATABASE HOST:$LYELLOW ${wpHost[i]}";
				echo -e " $GREEN${wpMultisite[i]}$DCOLOR";
				echo -e "$LRED DATABASE CONNECTIVITY: $wpConnectivity";
				echo -e " ";
				if [ $wpAnalyze == 1 ];
					then
						echo -e "$LRED WORDPRESS SITEURL: $LGREEN $wpSiteurl";
						echo -e "$LRED WORDPRESS HOMEURL: $GREEN $wpHome";
						echo -e " ";
						echo -e "$LRED SITEURL HTTP HEADER:$YELLOW $wpSiteUrlHTTP$DCOLOR";
						echo -e "$LRED HOMEURL HTTP HEADER:$YELLOW $wpHomeHTTP$DCOLOR";
						echo -e " ";
						echo -e "$LRED ADMIN USERNAME:$GREEN $wpAdminName$DCOLOR";
						echo -e "$LRED ADMIN PASSWORD:$LBLUE $wpAdminPass$DCOLOR";
				fi
				echo -e " ";
				echo -e "$LRED FILE PERMISSIONS:${wpPermissions[i]}$DCOLOR";
						#find "${wpDir[i]}" -type f ! -perm 0644 -print0 | xargs -0 chmod 644;
				echo -e "$BLUE#####################################################################$DCOLOR";
			done	
		else
			echo -e "$BLUE#####################################################################";
            echo -e "$BLUE#              $RED  NO$YELLOW WORDPRESS$RED APPLICATIONS FOUND!   $BLUE                #";
            echo -e "$BLUE#####################################################################$DCOLOR";
	fi
}

function checkJoomla {
	jmInstalls=$(findApps jm);
    if [ "$jmInstalls" != 0 ];
        then
            echo -e "$BLUE#####################################################################";
            echo -e "$BLUE#            $RED    $YELLOW     JOOMLA$RED APPLICATIONS FOUND: $GREEN$jmInstalls                  $BLUE#";
            echo -e "$BLUE#####################################################################$DCOLOR";
            for(( i=1; i<jmInstalls+1; i++ ))
            do
                jmDir[$i]=$(find "$PWD" -type f -name "configuration.php" | sed -e 's/configuration.php//g' | sed -n "$i"p);
                jmDatabase[$i]=$(find "$PWD" -type f -name "configuration.php" -print0 | xargs -0 grep '$db =' | awk -F"'" '{print $2}' | sed -n "$i"p);
                jmUser[$i]=$(find "$PWD" -type f -name "configuration.php" -print0 | xargs -0 grep '$user' | awk -F"'" '{print $2}' | sed -n "$i"p);
                jmPassword[$i]=$(find "$PWD" -type f -name "configuration.php" -print0 | xargs -0 grep '$password' | awk -F"'" '{print $2}' | sed -n "$i"p);
                jmHost[$i]=$(find "$PWD" -type f -name "configuration.php" -print0 | xargs -0 grep '$host' | awk -F"'" '{print $2}' | sed -n "$i"p);
                jmVersion[$i]=$(find "${jmDir[i]}libraries/cms/version/" -type f -name "version.php" -print0 | xargs -0 grep '$RELEASE =' | awk -F"'" '{print $2}');
                mysql -B -u"${jmUser[i]}" -p"${jmPassword[i]}" "${jmDatabase[i]}" --skip-column-names -e "EXIT" 2>/dev/null;
                if [ $? == 0 ];
                    then
                        jmConnectivity="$GREEN OKAY!$DCOLOR";
                    else
                        jmConnectivity="$RED ERROR!$DCOLOR";
                fi
                echo -e "$BLUE#       $RED            $YELLOW      JOOMLA$RED APPLICATION: $GREEN#$i$BLUE                    #";
                echo -e "$BLUE#            $RED                VERSION: $GREEN${jmVersion[i]}$BLUE                           #";
                echo -e "$BLUE#####################################################################$DCOLOR";
                echo -e " ";
                echo -e "$LRED ABSOLUTE PATH:$YELLOW ${jmDir[i]}";
                echo -e "$LRED DATABASE NAME:$LGREEN ${jmDatabase[i]}";
                echo -e "$LRED DATABASE USER:$LGREEN ${jmUser[i]}";
                echo -e "$LRED DATABASE PASS:$GREEN ${jmPassword[i]}";
                echo -e "$LRED DATABASE HOST:$LYELLOW ${jmHost[i]}";
                echo -e " ";
                echo -e "$LRED DATABASE CONNECTIVITY: $jmConnectivity";
                echo -e " ";
                echo -e "$BLUE#####################################################################$DCOLOR";
            done
        else
            echo -e "$BLUE#####################################################################";
            echo -e "$BLUE#              $RED     NO$YELLOW JOOMLA$RED APPLICATIONS FOUND!   $BLUE                #";
            echo -e "$BLUE#####################################################################$DCOLOR";
    fi
}

function checkMagento {
	mgInstalls=$(findApps mg);
    if [ "$mgInstalls" != 0 ];
        then
            echo -e "$BLUE#####################################################################";
            echo -e "$BLUE#            $RED   $YELLOW     MAGENTO$RED APPLICATIONS FOUND: $GREEN$mgInstalls                  $BLUE#";
            echo -e "$BLUE#####################################################################$DCOLOR";
            for(( i=1; i<mgInstalls+1; i++ ))
            do
                mgDir[$i]=$(find "$PWD" -type f -name "local.xml" | sed -e 's/app\/etc\/local.xml//g' | sed -n "$i"p);
                mgDatabase[$i]=$(find "$PWD" -type f -name "local.xml" -print0 | xargs -0 grep dbname | awk -F"[" '{print $3}' | awk -F"]" '{print $1}' | sed -n "$i"p);
                mgUser[$i]=$(find "$PWD" -type f -name "local.xml" -print0 | xargs -0 grep username | awk -F"[" '{print $3}' | awk -F"]" '{print $1}' | sed -n "$i"p);
                mgPassword[$i]=$(find "$PWD" -type f -name "local.xml" -print0 | xargs -0 grep password | awk -F"[" '{print $3}' | awk -F"]]" '{print $1}' | sed -n "$i"p);
                mgHost[$i]=$(find "$PWD" -type f -name "local.xml" -print0 | xargs -0 grep host | awk -F"[" '{print $3}' | awk -F"]" '{print $1}' | sed -n "$i"p);
                mgVera[$i]=$(find "${mgDir[i]}app/" -type f -name "Mage.php" -print0 | xargs -0 grep -A6 'static function getVersionInfo' | sed -n 4p | awk -F"'" '{print $4}');
                mgVerb[$i]=$(find "${mgDir[i]}app/" -type f -name "Mage.php" -print0 | xargs -0 grep -A6 'static function getVersionInfo' | sed -n 5p | awk -F"'" '{print $4}');
                mgVerc[$i]=$(find "${mgDir[i]}app/" -type f -name "Mage.php" -print0 | xargs -0 grep -A6 'static function getVersionInfo' | sed -n 6p | awk -F"'" '{print $4}');
                mgVerd[$i]=$(find "${mgDir[i]}app/" -type f -name "Mage.php" -print0 | xargs -0 grep -A6 'static function getVersionInfo' | sed -n 7p | awk -F"'" '{print $4}');
                mysql -B -u"${mgUser[i]}" -p"${mgPassword[i]}" "${mgDatabase[i]}" --skip-column-names -e "EXIT" 2>/dev/null;
                if [ $? == 0 ];
                    then
                        mgConnectivity="$GREEN OKAY!$DCOLOR";
                    else
                        mgConnectivity="$RED ERROR!$DCOLOR";
                fi
                echo -e "$BLUE#       $YELLOW                 MAGENTO$RED APPLICATION: $GREEN#$i$BLUE                    #";
                echo -e "$BLUE#            $RED              VERSION: $GREEN${mgVera[i]}.${mgVerb[i]}.${mgVerc[i]}.${mgVerd[i]}$BLUE                         #";
                echo -e "$BLUE#####################################################################$DCOLOR";
                echo -e " ";
                echo -e "$LRED ABSOLUTE PATH:$YELLOW ${mgDir[i]}";
                echo -e "$LRED DATABASE NAME:$LGREEN ${mgDatabase[i]}";
                echo -e "$LRED DATABASE USER:$LGREEN ${mgUser[i]}";
                echo -e "$LRED DATABASE PASS:$GREEN ${mgPassword[i]}";
                echo -e "$LRED DATABASE HOST:$LYELLOW ${mgHost[i]}";
                echo -e " ";
                echo -e "$LRED DATABASE CONNECTIVITY: $mgConnectivity";
                echo -e " ";
                echo -e "$BLUE#####################################################################$DCOLOR";
            done
        else
            echo -e "$BLUE#####################################################################";
            echo -e "$BLUE#              $RED    NO$YELLOW MAGENTO$RED APPLICATIONS FOUND!   $BLUE                #";
            echo -e "$BLUE#####################################################################$DCOLOR";
    fi
}

function checkDrupal {
    dpInstalls=$(findApps dp);
    if [ "$dpInstalls" != 0 ];
        then
            echo -e "$BLUE#####################################################################";
            echo -e "$BLUE#           $RED   $YELLOW       DRUPAL$RED APPLICATIONS FOUND: $GREEN$dpInstalls                  $BLUE#";
            echo -e "$BLUE#####################################################################$DCOLOR";
            for(( i=1; i<dpInstalls+1; i++ ))
            do
                dpDir[$i]=$(find "$PWD" -type f -name "default.settings.php" | sed -e 's/sites\/default\/default.settings.php//g' | sed -n "$i"p);
                dpDatabase[$i]=$(find "${dpDir[i]}" -type f -name "settings.php" -print0 | xargs -0 grep '^$databases' -A11 |  awk -F"'" '{print $4}' | sed -n 6p);
				dpDatabase[$i]=$(isEmpty "${dpDatabase[i]}");
                dpUser[$i]=$(find "${dpDir[i]}" -type f -name "settings.php" -print0 | xargs -0 grep '^$databases' -A11 |  awk -F"'" '{print $4}' | sed -n 7p);
				dpUser[$i]=$(isEmpty "${dpUser[i]}");
                dpPassword[$i]=$(find "${dpDir[i]}" -type f -name "settings.php" -print0 | xargs -0 grep '^$databases' -A11 |  awk -F"'" '{print $4}' | sed -n 8p);
				dpPassword[$i]=$(isEmpty "${dpPassword[i]}");
                dpHost[$i]=$(find "${dpDir[i]}" -type f -name "settings.php" -print0 | xargs -0 grep '^$databases' -A11 |  awk -F"'" '{print $4}' | sed -n 9p);
				dpHost[$i]=$(isEmpty "${dpHost[i]}");
                dpVer[$i]=$(find "${dpDir[i]}includes/" -type f -name "bootstrap.inc" -print0 | xargs -0 grep "VERSION" | head -n1 | awk -F"'" '{print $4}');
                mysql -B -u"${dpUser[i]}" -p"${dpPassword[i]}" "${dpDatabase[i]}" --skip-column-names -e "EXIT" 2>/dev/null;
                if [ $? == 0 ];
                    then
                        dpConnectivity="$GREEN OKAY!$DCOLOR";
                    else
                        dpConnectivity="$RED ERROR!$DCOLOR";
                fi
                echo -e "$BLUE#       $YELLOW                  DRUPAL$RED APPLICATION: $GREEN#$i$BLUE                    #";
                echo -e "$BLUE#            $RED                VERSION: $GREEN${dpVer[i]}$BLUE                          #";
                echo -e "$BLUE#####################################################################$DCOLOR";
                echo -e " ";
                echo -e "$LRED ABSOLUTE PATH:$YELLOW ${dpDir[i]}";
                echo -e "$LRED DATABASE NAME:$LGREEN ${dpDatabase[i]}";
                echo -e "$LRED DATABASE USER:$LGREEN ${dpUser[i]}";
                echo -e "$LRED DATABASE PASS:$GREEN ${dpPassword[i]}";
                echo -e "$LRED DATABASE HOST:$LYELLOW ${dpHost[i]}";
                echo -e " ";
                echo -e "$LRED DATABASE CONNECTIVITY: $dpConnectivity";
                echo -e " ";
                echo -e "$BLUE#####################################################################$DCOLOR";
            done
        else
            echo -e "$BLUE#####################################################################";
            echo -e "$BLUE#              $RED     NO$YELLOW DRUPAL$RED APPLICATIONS FOUND!   $BLUE                #";
            echo -e "$BLUE#####################################################################$DCOLOR";
    fi
}

function checkPrestaShop {
    prInstalls=$(findApps pr); 
    if [ "$prInstalls" != 0 ];
        then
            echo -e "$BLUE#####################################################################";
            echo -e "$BLUE#            $YELLOW      PRESTASHOP$RED APPLICATIONS FOUND: $GREEN$prInstalls                 $BLUE#";
            echo -e "$BLUE#####################################################################$DCOLOR";
            for(( i=1; i<prInstalls+1; i++ ))
            do
                prDir[$i]=$(find "$PWD" -type f -name "settings.inc.php" | sed -e 's/config\/settings.inc.php//g' | sed -n "$i"p);
                prDatabase[$i]=$(find "$PWD" -type f -name "settings.inc.php" -print0 | xargs -0 grep 'DB_NAME' | awk -F"'" '{print $4}' | sed -n "$i"p);
                prUser[$i]=$(find "$PWD" -type f -name "settings.inc.php" -print0 | xargs -0 grep 'DB_USER' | awk -F"'" '{print $4}' | sed -n "$i"p);
                prPassword[$i]=$(find "$PWD" -type f -name "settings.inc.php" -print0 | xargs -0 grep 'DB_PASSWD' | awk -F"'" '{print $4}' | sed -n "$i"p);
                prHost[$i]=$(find "$PWD" -type f -name "settings.inc.php" -print0 | xargs -0 grep 'DB_SERVER' | awk -F"'" '{print $4}' | sed -n "$i"p);
                prVersion[$i]=$(find "${prDir[i]}" -type f -name "settings.inc.php" -print0 | xargs -0 grep 'PS_VERSION' | sed -n 2p | awk -F"'" '{print $4}');
                mysql -B -u"${prUser[i]}" -p"${prPassword[i]}" "${prDatabase[i]}" --skip-column-names -e "EXIT" 2>/dev/null;
                if [ $? == 0 ];
                    then
                        prConnectivity="$GREEN OKAY!$DCOLOR";
                    else
                        prConnectivity="$RED ERROR!$DCOLOR";
                fi
                echo -e "$BLUE#       $RED          $YELLOW     PRESTASHOP$RED APPLICATION: $GREEN#$i$BLUE                   #";
                echo -e "$BLUE#            $RED              VERSION: $GREEN${prVersion[i]}$BLUE                         #";
                echo -e "$BLUE#####################################################################$DCOLOR";
                echo -e " ";
                echo -e "$LRED ABSOLUTE PATH:$YELLOW ${prDir[i]}";
                echo -e "$LRED DATABASE NAME:$LGREEN ${prDatabase[i]}";
                echo -e "$LRED DATABASE USER:$LGREEN ${prUser[i]}";
                echo -e "$LRED DATABASE PASS:$GREEN ${prPassword[i]}";
                echo -e "$LRED DATABASE HOST:$LYELLOW ${prHost[i]}";
                echo -e " ";
                echo -e "$LRED DATABASE CONNECTIVITY: $prConnectivity";
                echo -e " ";
                echo -e "$BLUE#####################################################################$DCOLOR";
            done
        else
            echo -e "$BLUE#####################################################################";
            echo -e "$BLUE#              $RED  NO$YELLOW PRESTASHOP$RED APPLICATIONS FOUND!   $BLUE                #";
            echo -e "$BLUE#####################################################################$DCOLOR";
    fi
}

# Setup flags in case
case $1 in
	-i) checkApplications;
		;;
	-w) checkWordPress;
		;;
	-j) checkJoomla;
		;;
	-m) checkMagento;
		;;
	-d) checkDrupal;
		;;
	-p) checkPrestaShop;
		;;
	-c) 
		;;
	-f) filePermissionCheck=$(find . -type f ! -perm 0644);
		dirPermissionCheck=$(find . -type d ! -perm 0755);
		fPerm=$(checkPermissions "$filePermissionCheck");
		dPerm=$(checkPermissions "$dirPermissionCheck");
		echo -e "$LBLUE                  FILE AND DIRECTORY PERMISSION REPORT:$DOCLOR";
		echo -e " ";
		echo -e "$YELLOW  FILE PERMISSIONS: $fPerm";
		echo -e "$YELLOW  DIR PERMISSIONS: $dPerm$DCOLOR";
		echo -e " ";
		if [ "$fPerm" == "$RED NOT OKAY!" ];
			then 
				echo -e " ... FIXING FILE PERMISSIONS ... ";
				find . -type f ! -perm 0644 -print0 | xargs -0 chmod 644;
				echo -e " ";
				filePermissionCheck=$(find . -type f ! -perm 0644);
				fPerm=$(checkPermissions "$filePermissionCheck");
				echo -e "$YELLOW  FILE PERMISSIONS NOW: $fPerm";
				echo -e "$DCOLOR";
		fi
        if [ "$dPerm" == "$RED NOT OKAY!" ];
            then
                echo -e " ... FIXING DIRECTORY PERMISSIONS ... ";
				find . -type d ! -perm 0755 -print0 | xargs -0 chmod 755;
                echo -e " ";
				dirPermissionCheck=$(find . -type d ! -perm 0755);
				dPerm=$(checkPermissions "$dirPermissionCheck");
				echo -e "$YELLOW  DIR PERMISSIONS NOW: $dPerm$DCOLOR";
				echo -e "$DCOLOR";
        fi
		;;
		
	*)  
		echo -e "$BLUE#####################################################################";
		echo -e "$BLUE#$GREEN -i $BLUE#$LYELLOW SCAN AND DISPLAY APPLICATION LOCATION $BLUE                       #";
		echo -e "$BLUE#####################################################################";
		echo -e "$BLUE#$GREEN -w $BLUE#$LYELLOW SCAN AND ANALYZE INSTALLED WORDPRESS APPLICATIONS$BLUE            #";
		echo -e "$BLUE#####################################################################";
		echo -e "$BLUE#$GREEN -j $BLUE#$LYELLOW SCAN AND ANALYZE INSTALLED JOOMLA APPLICATIONS$BLUE               #";
		echo -e "$BLUE#####################################################################$DCOLOR";
		echo -e "$BLUE#$GREEN -m $BLUE#$LYELLOW SCAN AND ANALYZE INSTALLED MAGENTO APPLICATIONS$BLUE              #";
		echo -e "$BLUE#####################################################################$DCOLOR";
		echo -e "$BLUE#$GREEN -d $BLUE#$LYELLOW SCAN AND ANALYZE INSTALLED DRUPAL APPLICATIONS$BLUE               #";
		echo -e "$BLUE#####################################################################$DCOLOR";
		echo -e "$BLUE#$GREEN -p $BLUE#$LYELLOW SCAN AND ANALYZE INSTALLED PRESTASHOP APPLICATIONS         $BLUE  #";
		echo -e "$BLUE#####################################################################$DCOLOR";
		echo -e "$BLUE#$GREEN -f $BLUE#$LYELLOW FIX FILE PERMISSIONS (644) AND DIRECTORY PERMISSIONS (755)$BLUE   #";
		echo -e "$BLUE#####################################################################$DCOLOR";
		echo -e "$BLUE#$GREEN - $BLUE#$LYELLOW $BLUE #";
		echo -e "$BLUE#####################################################################$DCOLOR";
		echo " ";;
esac
