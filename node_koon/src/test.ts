let str: string = 'hello';

let num:  number = 10;

let isLoggedIn: boolean = false;

let arr: number[] = [1,2,3];

let arr2: Array<number> = [1,2,3];

let tuple: [string, number] = ['hello', 10];

enum Avengers {Capts, Ironman, Thor}

let hero: Avengers = Avengers.Capts;

// let ggg: Avengers = Avengers[1];
console.log(str)

let strAny: any = 'hi';
let numAny: any = 10;
let arrAny: any = ['a', 2, true];


console.log(arrAny);
let unuserful: void = undefined;
function notuse(): void{
    console.log('sth');
}
