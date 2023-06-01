<?php

use app\modules\clientes\models\Direcciones;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\modules\clientes\models\DireccionesSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Direcciones';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="direcciones-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Direcciones', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_dirección',
            'id_cliente',
            'contacto',
            'teléfono',
            'dirección',
            //'id_municipio',
            //'id_departamento',
            //'principal',
            //'fecha_ing',
            //'id_usuario_ing',
            //'fecha_mod',
            //'id_usuario_mod',
            //'estado',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Direcciones $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_dirección' => $model->id_dirección]);
                 }
            ],
        ],
    ]); ?>


</div>
