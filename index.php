<?php require 'htmlElements/header.php'; ?>
<body>
<? require 'htmlElements/navbar.php'; ?>
<main class="container">

    <section class="products my-auto mx-auto">
        <div id="container-products-cart" class="container mx-center products-cart">
            <?
            require 'php/Database.php';
            $sqlCatalog = "SELECT  d.id,COUNT(d.trade_name) as countdrug,d.trade_name,d.international_name,min(dc.cost) as cost
            from drugs d,drugs_drugs_characteristics_link link,drugs_characteristics dc
            where link.drugs_characteristics_id=dc.id
            and link.drugs_id=d.id
            group by d.trade_name
            order by d.trade_name ";

            $db = Database::getInstance();
            $result = $db->query($sqlCatalog);

            $countCol = 0;
            ?>
            <div id="products-show" class="row justify-content-md-center-my-auto row-flex">
                <?
                foreach ($result as $row) :

                $currentName = $row['trade_name'];
                $idDrug = $row['id'];
                $cost = $row['cost'];
                $countDrug = $row['countdrug'];
                if ($countCol === 3):
                $countCol = 0;
                ?>
            </div>
            <div id="products-show<?= $currentName ?>" class="row justify-content-md-center-my-auto row-flex">
                <?
                endif;
                if ($countDrug > 1) :
                    $cost = "От " . $cost;
                endif;
                $countCol++;
                ?>
                <div class="col justify  content-center my-auto col-product">
                    <img class="img-fluid mx-auto d-block img-product" src="src/image/tabletki.png" alt="">
                    <div class="text-center">
                        <p class="name-product"><?= $currentName ?></p>
                        <div class="price"><?= $cost ?> руб.</div>
                    </div>
                    <p class="tag-button"><a class="btn btn-primary" href="productinfo.php?drug=<?= $idDrug ?>">Подробнее</a></p>
                </div>
                <? endforeach; ?>
            </div>
    </section>

</main><!-- /.container -->
<? require 'htmlElements/footer.php'; ?>