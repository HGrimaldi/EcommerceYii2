<?php

namespace app\modules\compras\controllers;

use app\models\Municipios;
use yii\helpers\Json;
use yii\web\Controller;

/**
 * Default controller for the `compras` module
 */
class DefaultController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
    public function actionMunicipios()
    {
        $out = [];
        $selected = null;
        
        if (isset($_POST['depdrop_parents'])) {

            $id = end($_POST['depdrop_parents']);
            $list = Municipios::find()->where(['id_departamento' => $id])->asArray()->all();

            if ($id != null && count($list) > 0) {
                $selected = '';
                if (!empty($_POST['depdrop_params'])) {
                    $id1 = $_POST['depdrop_all_params']['model_id1'];

                    foreach ($list as $sub_categoria) {
                        $out[] = ['id' => $sub_categoria['id_municipio'], 'name' => $sub_categoria['nombre']];

                        if ($sub_categoria['id_municipio'] == $id1) {
                            $selected = $id;
                        }
                    }
                }

                return Json::encode(['output' => $out, 'selected' => $selected]);
            }
        }
        return Json::encode(['output' => $out, 'selected' => $selected]);
    }
}
