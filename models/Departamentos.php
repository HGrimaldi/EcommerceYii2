<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tbl_departamentos".
 *
 * @property int $id_departamento
 * @property string $nombre
 * @property string $codigo
 *
 * @property TblMunicipios[] $tblMunicipios
 * @property TblProveedores[] $tblProveedores
 */
class Departamentos extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_departamentos';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'codigo'], 'required'],
            [['nombre'], 'string', 'max' => 255],
            [['codigo'], 'string', 'max' => 5],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_departamento' => 'Id Departamento',
            'nombre' => 'Nombre',
            'codigo' => 'Codigo',
        ];
    }

    /**
     * Gets query for [[TblMunicipios]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTblMunicipios()
    {
        return $this->hasMany(Municipios::class, ['id_departamento' => 'id_departamento']);
    }

    /**
     * Gets query for [[TblProveedores]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTblProveedores()
    {
        return $this->hasMany(Proveedores::class, ['id_departamento' => 'id_departamento']);
    }
}
