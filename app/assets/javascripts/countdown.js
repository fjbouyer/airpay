
function countdown() {
var countdown = document.getElementById("countdown");
var now = new Date();

var reservation_time = document.getElementById("event").getAttribute("data-time");

// var event = new Date("Jan 1 00:00:00 2018");
var event = new Date(reservation_time);
var total_secondes = (event - now) / 1000;
var prefixe = "Votre match commence dans ";
if (total_secondes <= 0)
 {
     prefixe = "Match en cours ou terminé"; // On modifie le préfixe si la différence est négatif
  }

if (total_secondes > 0)
  {
    var jours = Math.floor(total_secondes / (60 * 60 * 24));
    var heures = Math.floor((total_secondes - (jours * 60 * 60 * 24)) / (60 * 60));
    var minutes = Math.floor((total_secondes - ((jours * 60 * 60 * 24 + heures * 60 * 60))) / 60);
    var secondes = Math.floor(total_secondes - ((jours * 60 * 60 * 24 + heures * 60 * 60 + minutes * 60)));
  }
// else // Si total_secondes == 0 (puisque l'on a prit sa valeur absolue)
//  {
//      countdown.innerHTML = 'Compte à rebours terminé.';
//  }

var et = "et";
  var mot_jour = "jours,";
  var mot_heure = "heures,";
  var mot_minute = "minutes,";
  var mot_seconde = "secondes";

  if (jours == 0)
  {
      jours = '';
     mot_jour = '';
 }
 else if (jours == 1)
 {
     mot_jour = "jour,";
 }

 if (heures == 0)
 {
     heures = '';
     mot_heure = '';
 }
 else if (heures == 1)
 {
     mot_heure = "heure,";
 }

 if (minutes == 0)
 {
     minutes = '';
     mot_minute = '';
 }
 else if (minutes == 1)
 {
     mot_minute = "minute,";
 }

 if (secondes == 0)
 {
     secondes = '';
     mot_seconde = '';
     et = '';
 }
 else if (secondes == 1)
 {
     mot_seconde = "seconde";
 }

 if (minutes == 0 && heures == 0 && jours == 0)
 {
     et = "";
 }

countdown.innerHTML = jours + ' ' + mot_jour + ' ' + heures + ' ' + mot_heure + ' ' + minutes + ' ' + mot_minute + ' ' + et + ' ' + secondes + ' ' + mot_seconde;
actualisation = setTimeout("countdown();", 1000);
}

if ($('#countdown').length > 0) {
  countdown();
}
