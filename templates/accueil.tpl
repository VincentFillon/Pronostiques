<div class="row contenu">
    <section class="col-sm-8">
        <h1>Classement</h1>
        <!-- ================== -->
        <!-- Header classements -->
        <div id="header_choix_sport" class="row">
            <button id="btn-header_choix_sports" type="button" class="btn btn-header col-sm-2">Choix du sport</button>
            <span id="separateur" class="col-sm-1"> / </span>
        </div>
        
        <!-- ======================== -->
        <!-- Grille de choix du sport -->
        <div id="grille_choix_sport">
            <div id="choix_sports">
                <div class="row">
                    <button id="sports_co" type="button" class="btn btn-default col-sm-5" value="sports_collectifs">Sports Collectifs</button>
                    <div class="col-sm-2"></div>
                    <button id="sports_ind" type="button" class="btn btn-default col-sm-5" value="sports_individuels">Sports Individuels</button>
                </div>
            </div>

            <div id="sports_collectifs" style="display: none;">
                <div class="row">
                    <button id="foot" type="button" class="btn btn-default col-sm-5" value="classements_championnats">Football</button>
                    <div class="col-sm-2"></div>
                    <button id="basket" type="button" class="btn btn-default col-sm-5" value="classements_championnats">Basketball</button>
                </div>
                <div class="row">
                    <button id="rugby" type="button" class="btn btn-default col-sm-5" value="classements_championnats">Rugby</button>
                    <div class="col-sm-2"></div>
                    <button id="hand" type="button" class="btn btn-default col-sm-5" value="classements_championnats">Handball</button>
                </div>
            </div>

            <div id="sports_individuels" style="display: none;">
                <div class="row">
                    <button id="tennis" type="button" class="btn btn-default col-sm-5" value="classements_championnats">Tennis</button>
                    <div class="col-sm-2"></div>
                    <button id="boxe" type="button" class="btn btn-default col-sm-5" value="classements_championnats">Boxe</button>
                </div>
                <div class="row">
                    <button id="equitation" type="button" class="btn btn-default col-sm-5" value="classements_championnats">Equitation</button>
                    <div class="col-sm-2"></div>
                    <button id="golf" type="button" class="btn btn-default col-sm-5" value="classements_championnats">Golf</button>
                </div>
            </div>
        </div>

        <!-- ============================ -->
        <!-- Classements des championnats -->
        <div id="classements_championnats" style="display: none;">
            <div class="panel panel-default">
                <!-- Panel contents -->
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-sm-6">Choix du championnat</div>
                        <div class="dropdown col-sm-6">
                            <a id="championnat_choisit" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Championnats...<b class="caret"></b></a>
                            <ul id="liste_championnats" class="dropdown-menu col-sm-12" role="menu">
                                <!-- Contenu chargé dynamiquement grace à la méthode requestChampionnat() -->
                            </ul>
                        </div>
                    </div>
                </div>
                <span id="loader" style="display: none;"><img src="images/loading.gif" alt="loading" /></span>
                <!-- Table -->
                <table id="contenu_classement" class="table row">
                    <!-- Contenu chargé dynamiquement grace à la méthode requestClassement() -->
                </table>
            </div>
        </div>
    </section>

    <div class="col-sm-4">
        <div class="row">
            <aside id="actualites">
                <h5>Actualités</h5>
            </aside>
        </div>
    </div>
</div>