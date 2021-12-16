function sum(a: number, b: number):number {
    return a + b
}

function sum2(a: number, ...nums: number[]):number{
    let totalOfNums:number = 0;
  for (let key in nums) {
    totalOfNums += nums[key];
  }
  return a + totalOfNums;
}

let result: number = sum(1,2);

console.log(result) // -> 3