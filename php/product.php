<?php
include 'php/connection.php';


$db = Database::getInstance();
$sqlIndications = "SELECT  d.trade_name,d.international_name,di.indication
from drugs d,drugs_indications_for_use di,drugs_drugs_indications_for_use_link dil
where d.trade_name='".$_GET['drug']."' and d.id=dil.drugs_id and dil.drugs_indications_for_use_id=di.id";

$query = $db -> _db -> prepare($sqlIndications);
$query -> execute(array($_GET['drug']));
$query -> setFetchMode(PDO::FETCH_ASSOC);
$result = $query -> fetchAll();

    foreach ( $result as $rowIndications ) {
    $tradeName=$rowIndications[ 'trade_name' ];
    $international_name=$rowIndications[ 'international_name' ];
    $indication .= $rowIndications[ 'indication' ];
}
if ($tradeName==''){
    $tradeName=$_GET['drug'];
}
$druginfo="<img class=\"img-fluid mx-auto d-block img-product\" src=\"src/image/tabletki.png\">
    <div class=\"text-center\">
     <p class=\"name-product\">$tradeName</p>
     <p class=\"name-product1\">МНН: $international_name</p>
    </div>
    <h5 class=\"text-start\">Показания к применению:</h5>
    <p class=\"text-start\">$indication</p>";

$druginfo.=" <h5 class=\"text-start\">Формы выпуска:</h5>";

//$sqlCharacteristics = "SELECT  dc.form_of_issue,dc.dosage,dc.cost
//from drugs d,drugs_characteristics dc,drugs_drugs_characteristics_link dci
//where d.trade_name='".$_GET['drug']."' and d.id=dci.drugs_id and dci.drugs_characteristics_id=dc.id";
//
//$queryCharacteristics = mysqli_query($link, $sqlCharacteristics) or die("Ошибка " . mysqli_error($link));
//while ( $rowCharacteristics = mysqli_fetch_assoc( $queryCharacteristics ) ) {
//    $form_of_issue=$rowCharacteristics[ 'form_of_issue' ];
//    $dosage=$rowCharacteristics[ 'dosage' ];
//    $cost=$rowCharacteristics[ 'cost' ];
//
//    $druginfo.="<div id=\"products-Characteristics\" class=\"row justify-content-md-center-my-auto row-flex text-center border-up\">
//            <div class=\"col justify  content-center my-auto col-product\">
//              <h6>Форма выпуска:</h6>
//              <p>$form_of_issue</p>
//             </div>
//            <div class=\"col justify  content-center my-auto col-product\">
//              <h6>Дозировка:</h6>
//              <p>$dosage</p>
//            </div>
//            <div class=\"col justify  content-center my-auto col-product\">
//              <h6>Цена:</h6>
//              <p>$cost руб.</p>
//            </div>
//          </div>";
//}
