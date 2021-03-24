<? require 'htmlElements/header.php'; ?>
<body>
<? require 'htmlElements/navbar.php'; ?>

<main class="container">

    <section class="products my-auto mx-auto">
        <div id="container-products-cart" class="container mx-center products-cart">
            <div id="products-show" class="row justify-content-md-center-my-auto row-flex">
                <?
                require 'php/connection.php';
                $db = Database::getInstance();
                //запрос на выборку показаний препарата из базы данных
                $sqlIndications = "SELECT  d.trade_name,d.international_name,di.indication
                from drugs d,drugs_indications_for_use di,drugs_drugs_indications_for_use_link dil
                where dil.drugs_id=:id and dil.drugs_id=d.id and dil.drugs_indications_for_use_id=di.id";

                $query = $db->_db->prepare($sqlIndications);
                $query->execute(array(':id' => $_GET['drug']));
                $query->setFetchMode(PDO::FETCH_ASSOC);
                $result = $query->fetchAll();

                foreach ($result as $rowIndications) {
                    $tradeName = $rowIndications['trade_name'];
                    $internationalName = $rowIndications['international_name'];
                    $indication .= $rowIndications['indication'];
                }
                if ($tradeName == '') {
                    $tradeName = "Данные не заполнены";
                }
                ?>
                <!--вывод названия и показаний-->
                <img class="img-fluid mx-auto d-block img-product" src="src/image/tabletki.png" alt="">
                <div class="text-center">
                    <p class="name-product"><?= $tradeName ?></p>
                    <p class="name-product1">МНН: <?= $internationalName ?></p>
                </div>
                <h5 class="text-start">Показания к применению:</h5>
                <p class="text-start"><?= $indication ?></p>
                <?
                //запрос на выборку форм выпуска, дозировки и цены препарата из бд
                $sqlCharacteristics = "SELECT  dc.form_of_issue,dc.dosage,dc.cost
                from drugs d,drugs_characteristics dc,drugs_drugs_characteristics_link dci
                where dci.drugs_id=:id and d.id=dci.drugs_id and dci.drugs_characteristics_id=dc.id";

                $query = $db->_db->prepare($sqlCharacteristics);
                $query->execute(array(':id' => $_GET['drug']));
                $query->setFetchMode(PDO::FETCH_ASSOC);
                $result = $query->fetchAll();

                foreach ($result as $rowCharacteristics) {
                    $form_of_issue = $rowCharacteristics['form_of_issue'];
                    $dosage = $rowCharacteristics['dosage'];
                    $cost = $rowCharacteristics['cost'];
                    ?>
                    <!--вывод форм выпуска-->
                    <h5 class="text-start">Формы выпуска:</h5>
                    <div id="products-Characteristics"
                         class="row justify-content-md-center-my-auto row-flex text-center border-up">
                        <div class="col justify  content-center my-auto col-product">
                            <h6>Форма выпуска:</h6>
                            <p><?= $form_of_issue ?></p>
                        </div>
                        <div class="col justify  content-center my-auto col-product">
                            <h6>Дозировка:</h6>
                            <p><?= $dosage ?></p>
                        </div>
                        <div class="col justify  content-center my-auto col-product">
                            <h6>Цена:</h6>
                            <p><?= $cost ?> руб.</p>
                        </div>
                    </div>
                    <?
                }
                ?>

            </div>
        </div>

    </section>


</main><!-- /.container -->

</body>
</html>

