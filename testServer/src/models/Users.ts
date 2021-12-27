import {
    Sequelize, 
    DataTypes, 
    Model, 
    Optional,
    HasManyGetAssociationsMixin,
    HasManyAddAssociationMixin,
    HasManyHasAssociationMixin,
    HasManyCountAssociationsMixin,
    HasManyCreateAssociationMixin,
    Association
} from 'sequelize';
import {sequelize} from './index';


interface UsersAttributes{
    // id: number | null;
    userid : string,
    userpwd : string,
    username : string,
    email: string,     
    nickname : string,    
    birth: Date,
    joindate: Date,
}

class Users extends Model<UsersAttributes>{
    public readonly id! : number;   //굳이 안넣어줘도 될 것 같지만 공식문서에 있으니깐 일단 넣어줌.
    public userid! : {
        type:string
        primaryKey: true,
    };
    public userpwd! :{
        type: string,
        uniqueKey: true,
    };
    public username! : {
        type: string,
    };
    public email!: {
        type: string,
    };
    public nickname! : {
        type: string,
    };
    public birth! : {
        type: Date,
    };
    public joindate! : {
        type: Date,    
    };
    // timestamps!
    public readonly createdAt!: Date;   //굳이 안넣어줘도 될 것 같지만 공식문서에 있으니깐 일단 넣어줌.
    public readonly updatedAt!: Date;   //굳이 안넣어줘도 될 것 같지만 공식문서에 있으니깐 일단 넣어줌.
}

Users.init(
    {
        userid:{ 
            type: DataTypes.STRING(20),            
            allowNull: false,
        },
        userpwd: {
            type: DataTypes.STRING(20),
            allowNull: false,
        }, 
        username:{
            type: DataTypes.STRING(10),
            allowNull: false,
        },
        email: {
            type: DataTypes.STRING(30),
            allowNull: false,
        },
    
        nickname: {
            type: DataTypes.STRING(12),
            allowNull: false,
        },
    
        birth: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        joindate: {
            type: DataTypes.DATE,            
            allowNull: false,
            // defaultValue: sequelize.literal('NOW()')
        },
    
    },
    {
        modelName : 'Users',
        tableName : 'Users',
        sequelize,
        freezeTableName : true,
        timestamps : true,
        updatedAt : 'updateTimestamp'
    }
)