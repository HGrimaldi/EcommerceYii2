<?php

namespace app\modules\clientes\models;

use app\models\Departamentos;
use app\models\Municipios;
use Usuarios;
use Yii;

/**
 * This is the model class for table "tbl_direcciones".
 *
 * @property int $id_dirección
 * @property int $id_cliente
 * @property string $contacto
 * @property string $teléfono
 * @property string $dirección
 * @property int $id_municipio
 * @property int $id_departamento
 * @property int $principal
 * @property string|null $fecha_ing
 * @property int|null $id_usuario_ing
 * @property string|null $fecha_mod
 * @property int|null $id_usuario_mod
 * @property int $estado
 *
 * @property Clientes $cliente
 * @property Departamentos $departamento
 * @property Municipios $municipio
 * @property Usuarios $usuarioIng
 * @property Usuarios $usuarioMod
 */
class Direcciones extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_direcciones';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_cliente', 'contacto', 'teléfono', 'dirección', 'id_municipio', 'id_departamento', 'principal', 'estado'], 'required'],
            [['id_cliente', 'id_municipio', 'id_departamento', 'principal', 'id_usuario_ing', 'id_usuario_mod', 'estado'], 'integer'],
            [['fecha_ing', 'fecha_mod'], 'safe'],
            [['contacto', 'teléfono', 'dirección'], 'string', 'max' => 255],
            [['id_cliente'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Clientes::class, 'targetAttribute' => ['id_cliente' => 'id_cliente']],
            [['id_departamento'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Departamentos::class, 'targetAttribute' => ['id_departamento' => 'id_departamento']],
            [['id_municipio'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Municipios::class, 'targetAttribute' => ['id_municipio' => 'id_municipio']],
            [['id_usuario_ing'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Usuarios::class, 'targetAttribute' => ['id_usuario_ing' => 'id_usuario']],
            [['id_usuario_mod'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Usuarios::class, 'targetAttribute' => ['id_usuario_mod' => 'id_usuario']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_dirección' => 'Id Dirección',
            'id_cliente' => 'Id Cliente',
            'contacto' => 'Contacto',
            'teléfono' => 'Teléfono',
            'dirección' => 'Dirección',
            'id_municipio' => 'Id Municipio',
            'id_departamento' => 'Id Departamento',
            'principal' => 'Principal',
            'fecha_ing' => 'Fecha Ing',
            'id_usuario_ing' => 'Id Usuario Ing',
            'fecha_mod' => 'Fecha Mod',
            'id_usuario_mod' => 'Id Usuario Mod',
            'estado' => 'Estado',
        ];
    }

    /**
     * Gets query for [[Cliente]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCliente()
    {
        return $this->hasOne(Clientes::class, ['id_cliente' => 'id_cliente']);
    }

    /**
     * Gets query for [[Departamento]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDepartamento()
    {
        return $this->hasOne(Departamentos::class, ['id_departamento' => 'id_departamento']);
    }

    /**
     * Gets query for [[Municipio]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMunicipio()
    {
        return $this->hasOne(Municipios::class, ['id_municipio' => 'id_municipio']);
    }

    /**
     * Gets query for [[UsuarioIng]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarioIng()
    {
        return $this->hasOne(Usuarios::class, ['id_usuario' => 'id_usuario_ing']);
    }

    /**
     * Gets query for [[UsuarioMod]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarioMod()
    {
        return $this->hasOne(Usuarios::class, ['id_usuario' => 'id_usuario_mod']);
    }
}
