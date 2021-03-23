<?php
include 'php/connection.php';


$sql = "SELECT  COUNT(d.trade_name) as countdrug,d.trade_name,d.international_name,min(dc.cost) as cost
from drugs d,drugs_drugs_characteristics_link link,drugs_characteristics dc
where link.drugs_characteristics_id=dc.id
and link.drugs_id=d.id
group by d.trade_name
order by d.trade_name ";

$db = Database::getInstance();

$products="<div id=\"products-show\" class=\"row justify-content-md-center-my-auto row-flex\">";
$countcol=0;

if ($result = $db->query($sql)) {
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {

    $currentname=$row[ 'trade_name' ];
    $cost=$row[ 'cost' ];
    $countdrug=$row['countdrug'];
    if ($countcol===3){
        $products.="</div>";
        $products.="<div id=\"products-show$currentname\" class=\"row justify-content-md-center-my-auto row-flex\">";
        $countcol=0;
    }
    if ($countdrug > 1){
        $cost= "От ".$cost;
    }
    $products.="<div class=\"col justify  content-center my-auto col-product\">
    <img class=\"img-fluid mx-auto d-block img-product\" src=\"src/image/tabletki.png\">
    <div class=\"text-center\">
    <p class=\"name-product\">$currentname</p>
    <p><div class=\"price\">$cost руб.</div></p>
    </div>
    <p class=\"tag-button\"><button class=\"btn btn-primary\" value=\"$currentname\">Подробнее</button></p></div>";
    $countcol++;
    }

}
