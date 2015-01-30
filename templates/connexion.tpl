<div class="row"> 
    <form id="connexion_form" role="form" class="col-sm-4">
        <div class="form-group">
            <div id="connexion_login" class="input-group">
                <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
            <?php if ( $_COOKIE['login_pronostiques'] ) { ?>
                    <input class="form-control" type="text" value=<?php echo $_COOKIE['login_pronostiques']; ?>>
            <?php }
                  else { ?>
                    <input class="form-control" type="text" placeholder="Login">
            <?php } ?>
                <span class="label label-danger" style="display: none;">Ce login incorrect</span>
            </div>
        </div>
        <div class="form-group">
            <div id="connexion_password" class="input-group">
                <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                <input class="form-control" type="password" placeholder="Mot de passe">
                <span class="label label-danger" style="display: none;">Mot de passe incorrect</span>
            </div>
        </div>
        <button type="submit" class="btn btn-default">Connexion</button>
    </form>

    <div class="alert alert-info col-sm-4" role="alert">
        Pas encore inscrit ? <a href="index.php?page=inscription.tpl" class="alert-link">S'inscrire maintenant</a>
    </div>

    <div class="col-sm-4">
        <div class="row">
            <aside id="actualites">
                <h5>Actualités</h5>
            </aside>
        </div>
    </div>
</div>