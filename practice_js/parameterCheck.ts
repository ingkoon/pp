
// type check
interface person{
	personName?: string;
}

function testPerson(p: person){
	console.log(p.personName);
}


let personVal = {personNameis: 'Lee'};

// val mapping func
testPerson( person1 as person);



// 함수 타입 정의
interface login {
    (username: string, password: string): boolean;
  }

let loginUser: login;
loginUser = function(id: string, pw: string) {
  console.log('로그인 했습니다');
  return true;
}