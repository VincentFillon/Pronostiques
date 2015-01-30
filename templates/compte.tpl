<?php 
    $login = (isset($_GET['login'])) ? htmlentities($_GET['login']) : NULL;
?>

<section id="gestion_compte">
    <ul class="nav nav-tabs nav-justified" role="tablist">
        <li class="active"><a href="#" value="user_profil-panel">Mon profil</a></li>
        <li><a href="#" value="user_stats-panel">Mes statistiques</a></li>
        <li><a href="#" value="user_groups-panel">Groupe(s) / Equipe(s)</a></li>
    </ul>
    <div id="user_profil-panel">
        <div class="list-group">
            <li id="gestion_compte-login_modifier" class="input-group">
                <span class="input-group-addon">Login :</span>
                <input type="text" class="form-control" value=<?php echo $login ?>>
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-cog"></span> Modifier</button>
                </span>
            </li>
            <li id="gestion_compte-mdp" class="input-group">
                <span class="input-group-addon">Mot de passe :</span>
                <input type="text" class="form-control" value="********">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-cog"></span> Modifier</button>
                </span>
            </li>
            <li id="gestion_compte-mail" class="input-group">
                <span class="input-group-addon">Adresse E-Mail :</span>
                <input type="text" class="form-control">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-cog"></span> Modifier</button>
                </span>
            </li>
        </div>
    </div>
    <div id="user_stats-panel" style="display: none;">
        
    </div>
    <div id="user_groups-panel" style="display: none;">
        
    </div>
</section>