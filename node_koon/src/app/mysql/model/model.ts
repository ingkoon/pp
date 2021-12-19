import {Table, Column, Model, HasMany} from 'sequelize-typescript';

@Table
class USER extends Model<USER> {

  @Column
  name: string;

  @Column
  birthday: Date;

}