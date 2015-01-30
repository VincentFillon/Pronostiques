/* 
    Created on : 28 oct. 2014, 16:15:28
    Author     : Vincent FILLON
*/

/**
* Méthode qui permet de retourner le paramètre de l'url souhaité
* @param sParam {string} : nom du paramètre
*/
function getUrlParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] === sParam) 
        {
            return sParameterName[1];
        }
    }
}

// ========================================================================== //
// ***************************** Page d'Accueil ***************************** //
// ========================================================================== //

// Fonctions click sur les boutons Choix du sport
// ============================================================================

/**
* Fonction appelée lors du click sur un des boutons de choix de sport
*/
$("#grille_choix_sport").on("click", "button", function(){
    var id = $(this).attr("id");
    var value = $(this).attr("value");
    $(this).parent().parent().slideUp();
    $('#' + value).fadeIn(1500);
    if ( id === "sports_co" || id === "sports_ind" ){
        $("#header_choix_sport").append('<button id="btn-header_' + value + '" type="button" class="btn btn-header col-sm-2">' + $(this).text() + '</button>');
    }
    else {
        $("#header_choix_sport").append('<button id="btn-header_' + id + '" type="button" class="btn btn-header col-sm-2">' + $(this).text() + '</button>');
    }
    var separateur = $("#separateur").clone();
    separateur.appendTo("#header_choix_sport");
    if ( value === "classements_championnats" ) {
        requestChampionnats(id);
    }
});

/**
* Fonction appelée lors du click sur un des boutons du header classement
*/
$("#header_choix_sport").on("click", "button", function(){
    var id = $(this).attr("id");
    if ( id === "btn-header_choix_sports" ) {
        $("#grille_choix_sport").children().slideUp();
        $("#classements_championnats").slideUp();
        $("#header_choix_sport > button:gt(0)").remove();
        $("#header_choix_sport > #separateur:gt(0)").remove();
        $("#choix_sports").fadeIn(1500);
    }
    if ( id === "btn-header_sports_collectifs" || id === "btn-header_sports_individuels" ) {
        $("#classements_championnats").slideUp();
        $("#header_choix_sport > button:gt(1)").remove();
        $("#header_choix_sport > #separateur:gt(1)").remove();
        if ( id === "btn-header_sports_collectifs" ) {
            $("#sports_collectifs").fadeIn(1500);
        }
        if ( id === "btn-header_sports_individuels" ) {
            $("#sports_individuels").fadeIn(1500);
        }
    }
    if ( $("#header_choix_sport button").index($(this)) === 2 ) {
        $("#header_choix_sport > button:gt(2)").remove();
    }
    $("#championnat_choisit").html("Championnats...<b class=\"caret\"></b>");
    $("#contenu_classement").html("");
});

/**
* Fonction appelée lors du choix d'un championnat dans la listBox générée par le choix d'un sport
*/
 $(".dropdown-menu").on('click', 'li a', function(){
    $("#championnat_choisit").html($(this).text() + '<b class="caret">');
    $("#championnat_choisit").attr("class", $(this).text());
    if ($("#header_choix_sport > button").length < 4){
       $("#header_choix_sport").append('<button id="header-btn_championnat" type="button" class="btn btn-header col-sm-3">' + $(this).text() + '</button>');
    }
    requestClassement($(this).attr("value"));
 });
 
// Fonctions de récupération asynchrone d'informations dans la base de donnée
// ============================================================================

/**
* Méthode utilisée par les méthodes "request" pour la création de l'Objet XMLHttpRequest
*/
function getXMLHttpRequest() {
    var xhr = null;

    if (window.XMLHttpRequest || window.ActiveXObject) {
        if (window.ActiveXObject) {
            try {
                    xhr = new ActiveXObject("Msxml2.XMLHTTP");
            } catch(e) {
                    xhr = new ActiveXObject("Microsoft.XMLHTTP");
            }
        } else {
            xhr = new XMLHttpRequest(); 
        }
    } else {
        alert("Votre navigateur ne supporte pas l'objet XMLHTTPRequest...");
        return null;
    }

    return xhr;
}
 
/**
* Méthode appelée lors du choix d'un sport pour afficher la liste des championnats dans la listBox
* @param {string} sport : chaîne de caractères contenant le nom du sport choisit
*/
function requestChampionnats(sport) {
    var xhr   = getXMLHttpRequest();

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && (xhr.status === 200 || xhr.status === 0)) {
            var xmlString = xhr.responseText;
            var parser = new DOMParser();
            var xmlDoc = parser.parseFromString(xmlString, "text/xml");
            readChampionnats(xmlDoc);
        }
    };

    xhr.open("POST", "traitement/recuperationChampionnats.php", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("sport=" + sport);
}

/**
* Méthode qui permet d'afficher la liste des championnats récupérée
* @param oData : fichier XML contenant les items à afficher
*/
function readChampionnats(oData) {
    var nodes  = oData.getElementsByTagName("item");
    var oListe = document.getElementById("liste_championnats");
    var oLigne, oLien, oInner, oValue;

    oListe.innerHTML = "";
    // Création du contenu de la liste
    for (var i=0, c=nodes.length; i<c; i++) {
        oLigne = document.createElement("li");
        oLien = document.createElement("a");
        var attributs = nodes[i].attributes;
        for (var h = 1; h < attributs.length; h ++){
            var attribut = attributs[h];
            if (attribut.name === "Championnat")
                oInner  = document.createTextNode(nodes[i].getAttribute(attribut.name));
            if (attribut.name === "id")
                oValue = nodes[i].getAttribute(attribut.name);
        }
        oLien.appendChild(oInner);
        oLien.setAttribute("value", oValue);
        oLigne.appendChild(oLien);
        oListe.appendChild(oLigne);
    }
}

/**
* Méthode qui sera appelée lors d'un choix dans la ListBox
* @param {string} value : chaîne de caractères contenant le nom du championnat choisit
*/
function requestClassement(value) {
    var xhr   = getXMLHttpRequest();

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && (xhr.status === 200 || xhr.status === 0)) {
            var xmlString = xhr.responseText;
            var parser = new DOMParser();
            var xmlDoc = parser.parseFromString(xmlString, "text/xml");
            readClassement(xmlDoc);
            document.getElementById("loader").style.display = "none";
        } else if (xhr.readyState < 4) {
            document.getElementById("loader").style.display = "inline";
        }
    };

    xhr.open("POST", "traitement/recuperationClassements.php", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("championnat=" + value);
}

/**
* Méthode qui permet d'afficher sur le site le classement récupéré
* @param oData : fichier XML contenant les items à afficher
*/
function readClassement(oData) {
    var nodes  = oData.getElementsByTagName("item");
    var oTable = document.getElementById("contenu_classement");
    var oTHead, oTBody, oLigne, oColonne, oInner;

    oTable.setAttribute("class", "table table-hover");
    oTable.innerHTML = "";
    // Création du header du tableau
    var attributesList = nodes[0].attributes;
    oTHead = document.createElement("thead");
    oLigne = document.createElement("tr");
    for(var j = 1; j < attributesList.length; j ++){
        oColonne = document.createElement("th");
        var attribut = attributesList[j];
        oInner  = document.createTextNode(attribut.name);
        oColonne.appendChild(oInner);
        oLigne.appendChild(oColonne);
    }
    oTHead.appendChild(oLigne);
    oTable.appendChild(oTHead);
    
    // Création du contenu du tableau
    oTBody = document.createElement("tbody");
    for (var i=0, c=nodes.length; i<c; i++) {
        oLigne = document.createElement("tr");
        var attributs = nodes[i].attributes;
        for(var h = 1; h < attributs.length; h ++){
            oColonne = document.createElement("td");
            var attribut = attributs[h];
            oInner  = document.createTextNode(nodes[i].getAttribute(attribut.name));
            oColonne.appendChild(oInner);
            oLigne.appendChild(oColonne);
        }
        oTBody.appendChild(oLigne);
    }
    oTable.appendChild(oTBody);
}

/** 
 * Méthode qui sera appelée lors du chargement de la page pour afficher les 5 dernières actualités
*/
window.onload = function requestActu() {
    var xhr   = getXMLHttpRequest();

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && (xhr.status === 200 || xhr.status === 0)) {
            var xmlString = xhr.responseText;
            var parser = new DOMParser();
            var xmlDoc = parser.parseFromString(xmlString, "text/xml");
            readActu(xmlDoc);
        }
    };

    xhr.open("POST", "traitement/recuperationActualites.php", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send();
};

/**
* Méthode qui permet d'afficher sur le site les actualités récupérées
* @param oData : fichier XML contenant les items à afficher
*/
function readActu(oData) {
    var nodes  = oData.getElementsByTagName("item");
    var oAside = document.getElementById("actualites");
    var oMedia, oImg, oBodyDiv, oBodyTitle, oTitre, oBodyText, oText, oBodyDate, oDate;
    
    // Création des 2* div Media 
    // *Chiffre choisit pour éviter de surcharger la page 
    // mais possibilité de le modifier (dans le if ci-dessous)
    for (var i=0; i<2; i++) {
        oMedia = document.createElement("div");
        oMedia.setAttribute("class", "media");
        oImg = document.createElement("img");
        oBodyDiv = document.createElement("div");
        oBodyDiv.setAttribute("class", "media-body");
        oBodyTitle = document.createElement("h6");
        oBodyText = document.createElement("p");
        oBodyDate = document.createElement("span");
        oBodyDate.setAttribute("id", "news-date");
        var attributs = nodes[i].attributes;
        for (var h = 1; h < attributs.length; h ++){
            var attribut = attributs[h];
            if (attribut.name === "Image")
                oImg.setAttribute("src", 'images/news/' + nodes[i].getAttribute(attribut.name));
            if (attribut.name === "Titre")
                oTitre = document.createTextNode(nodes[i].getAttribute(attribut.name));
            if (attribut.name === "Texte")
                oText = document.createTextNode(nodes[i].getAttribute(attribut.name));
            if (attribut.name === "Date")
                oDate = document.createTextNode(nodes[i].getAttribute(attribut.name));
        }
        oBodyTitle.appendChild(oTitre);
        oBodyText.appendChild(oText);
        oBodyDate.appendChild(oDate);
        oBodyDiv.appendChild(oBodyTitle);
        oBodyDiv.appendChild(oBodyText);
        oBodyDiv.appendChild(oBodyDate);
        oMedia.appendChild(oImg);
        oMedia.appendChild(oBodyDiv);
        oAside.appendChild(oMedia);
    }
}


// ========================================================================== //
// **************************** Page Inscription **************************** //
// ========================================================================== //

/** 
 * Méthode qui sera appelée lors de l'envoie du formulaire d'inscription
 * @param {eventHandler} event : eventHandler du formulaire
*/
$("#inscription_form").submit(function( event ){
    var login = $("#inscription_login input").val();
    var mdp = $("#inscription_password input").val();
    var mdp_confirm = $("#inscription_password-confirm input").val();
    var validate = true;
    
    // Vérification du login (doit contenir au moins 1 caractère)
    if ( login.length === 0 ) {
        $("#inscription_login .label-danger:first-of-type").show();
        validate = false;
    }
    else {
        $("#inscription_login .label-danger:first-of-type").hide();
    }
    
    // Vérification du mot de passe (doit contenir au moins 8 caractères dont au moins 1 chiffre)
    var reg = /^(?=.*\d)[0-9a-zA-Z]{8,}$/;
    if ( reg.test(mdp) ){
        $("#inscription_password .label-danger").hide();
        
        // Vérification de la confirmation du mot de passe (doit être identique au mot de passe)
        if ( mdp_confirm === mdp){
            $("#inscription_password-confirm .label-danger").hide();
        }
        else {
            $("#inscription_password-confirm .label-danger").show();
            validate = false;
        }
    }
    else {
        $("#inscription_password .label-danger").show();
        $("#inscription_password-confirm .label-danger").hide();
        validate = false;
    }
    
    // Envoi du formulaire si tout est validé
    if ( validate ){
        $("#inscription_form .label-danger").hide();
        requestInscription($("#inscription_email input").val(), login, mdp);
        event.preventDefault();
    }
    else {
        event.preventDefault();
    }
});

/** 
 * Méthode qui sera appelée lorsque le formulaire d'inscription a été validé coté client
 * @@param {string} email : email 
 * @@param {string} login : login 
 * @@param {string} mdp : mot de passe
*/
function requestInscription(email, login, mdp) {
    var xhr   = getXMLHttpRequest();
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && (xhr.status === 200 || xhr.status === 0)) {
            var xmlString = xhr.responseText;
            var parser = new DOMParser();
            var xmlDoc = parser.parseFromString(xmlString, "text/xml");
            readInscription(xmlDoc);
        }
    };

    xhr.open("POST", "traitement/inscription.php", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("email=" + email + "&login=" + login + "&mdp=" + mdp);
};

/**
* Méthode qui permet de retourner la réponse du serveur lors de la réception du formulaire d'inscription
* @param oData : fichier XML contenant la réponse du serveur
*/
function readInscription(oData) {
    var nodes  = oData.getElementsByTagName("item");
    
    if ( nodes[0].getAttribute("reponse") === "ok" ){
        document.cookie = "login_pronostiques=" + nodes[0].getAttribute("login");
        location.href="index.php?page=accueil.tpl";
    }
    else {
        for (var i=0, c=nodes.length; i<c; i++) {
            if ( nodes[i].getAttribute("reponse") === "email" ) {
                $("#inscription_email .label-danger").show();
            }
            if ( nodes[i].getAttribute("reponse") === "login" ) {
                $("#inscription_login .label-danger:last-of-type").show();
            }
        }
    }
}

// ========================================================================== //
// ***************************** Page Connexion ***************************** //
// ========================================================================== //

/** 
 * Méthode qui sera appelée lors de l'envoie du formulaire de connexion
 * @param {eventHandler} event : eventHandler du formulaire
*/
$("#connexion_form").submit(function( event ){
    var login = $("#connexion_login input").val();
    var mdp = $("#connexion_password input").val();
    
    // Vérification du login (doit contenir au moins 1 caractère)
    if ( login.length === 0 ) {
        $("#connexion_login .label-danger").show();
        event.preventDefault();
    }
    else {
        $("#connexion_login .label-danger").hide();
        requestConnexion(login, mdp);
        event.preventDefault();
    }
});

/** 
 * Méthode qui sera appelée lorsque le formulaire de connexion a été validé coté client
 * @@param {string} login : login 
 * @@param {string} mdp : mot de passe
*/
function requestConnexion(login, mdp) {
    var xhr   = getXMLHttpRequest();
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && (xhr.status === 200 || xhr.status === 0)) {
            var xmlString = xhr.responseText;
            var parser = new DOMParser();
            var xmlDoc = parser.parseFromString(xmlString, "text/xml");
            readConnexion(xmlDoc);
        }
    };

    xhr.open("POST", "traitement/connexion.php", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("login=" + login + "&mdp=" + mdp);
};

/**
* Méthode qui permet de retourner la réponse du serveur lors de la réception du formulaire d'inscription
* @param oData : fichier XML contenant la réponse du serveur
*/
function readConnexion(oData) {
    var nodes  = oData.getElementsByTagName("item");
    
    if ( nodes[0].getAttribute("reponse") === "ok" ){
        if ( nodes[0].getAttribute("admin") ) {
            location.href = "index.php?page=accueil.tpl&login=" + nodes[0].getAttribute("login") + "&admin=" + nodes[0].getAttribute("admin");
        }
        else {
            location.href = "index.php?page=accueil.tpl&login=" + nodes[0].getAttribute("login");
        }
    }
    else {
        for (var i=0, c=nodes.length; i<c; i++) {
            if ( nodes[i].getAttribute("reponse") === "login" ) {
                $("#connexion_login .label-danger").show();
            }
            if ( nodes[i].getAttribute("reponse") === "mdp" ) {
                $("#connexion_password .label-danger").show();
            }
        }
    }
}

// ========================================================================== //
// ***************************** Page Mon Compte **************************** //
// ========================================================================== //

/** 
 * Méthode qui sera appelée au chargement de la page pour récupérer le mail de l'utilisateur connecté
 * @param {string} login : login de l'utilisateur connecté
*/
$("#gestion_compte-login").ready(function (){
    var xhr   = getXMLHttpRequest();
    var login = getUrlParameter("login");
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && (xhr.status === 200 || xhr.status === 0)) {
            var xmlString = xhr.responseText;
            var parser = new DOMParser();
            var xmlDoc = parser.parseFromString(xmlString, "text/xml");
            readGestion(xmlDoc);
        }
    };

    xhr.open("POST", "traitement/recuperationGestion.php", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("login=" + login);
});

/**
* Méthode qui permet de retourner le mail de l'utilisateur connecté
* @param oData : fichier XML contenant la réponse du serveur
*/
function readGestion(oData) {
    var nodes  = oData.getElementsByTagName("item");
    $("#gestion_compte-mail input").attr("value", nodes[0].getAttribute("mail"));
}