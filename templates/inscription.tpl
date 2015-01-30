<div class="row"> 
    <form id="inscription_form" role="form" class="col-sm-4">
        <h1>Inscription</h1>
        <div class="form-group">
            <div id="inscription_email" class="input-group">
                <div class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></div>
                <input class="form-control" type="email" placeholder="Adresse Email">
                <span class="label label-danger" style="display: none;">Un compte utilise déjà cet Email</span>
            </div>
        </div>
        <div class="form-group">
            <div id="inscription_login" class="input-group">
                <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                <input class="form-control" type="text" placeholder="Login">
                <span class="label label-danger" style="display: none;">Ce login incorrect</span>
                <span class="label label-danger" style="display: none;">Ce login est déjà utilisé par un autre membre</span>
            </div>
        </div>
        <div class="form-group">
            <div id="inscription_password" class="input-group">
                <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                <input class="form-control" type="password" placeholder="Mot de passe">
                <span class="label label-danger" style="display: none;">Votre mot de passe doit contenir au moins 8 caractères dont au moins 1 chiffre</span>
            </div>
        </div>
        <div class="form-group">
            <div id="inscription_password-confirm" class="input-group">
                <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                <input class="form-control" type="password" placeholder="Confirmer le mot de passe">
                <span class="label label-danger" style="display: none;">Mot de passe incorrect</span>
            </div>
        </div>
        <button type="submit" class="btn btn-default">Créer le compte</button>
    </form>
    
    <div class="col-sm-4"></div>
    
    <div class="col-sm-4">
        <div class="row">
            <aside id="actualites">
                <h5>Actualités</h5>
            </aside>
        </div>
    </div>
</div>
