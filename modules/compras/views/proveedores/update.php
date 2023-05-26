<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\compras\models\proveedores $model */

$this->title = 'Editar Registro:';
$this->params['breadcrumbs'][] = ['label' => 'Listado', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => 'Detalle','url' => ['view', 'id_proveedor' => $model->id_proveedor]];
$this->params['breadcrumbs'][] = $this->title;;
?>
<div class="proveedores-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
