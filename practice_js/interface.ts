interface person{
	name: string;
	// ?를 선언하여 사용하지 않아도 됨을 명시
	age?: number 
}

let person1 = {
	name:'lee'
};

function printperson(input_person: person){
	console.log(input_person.name); // -> input_person.name 출력
}



printperson(person1); // -> lee 출력



let numArr: number[] = [1, 2, 3];

console.log(numArr[1]);