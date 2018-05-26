/*
Write an algorithm such that if an element in an MxN matrix is 0, its  entire row and column are set to 0. 
*/


var x = [
	[1, 0, 0, 1],
	[0, 0, 1, 0],
	[0, 0, 0, 0]
];

var xs = [
	[1, 1, 1, 1],
	[1, 1, 1, 1],
	[1, 0, 1, 1]
];


const traverseMatrix = (matrix, cb) => {
	for(let i = 0; i < matrix.length; i++) {
		for (let j = 0; j < matrix[0].length; j++) {
			let currCell = matrix[i][j];
			cb(currCell, i, j);
			// console.log(`>>> ${i} | ${j} | ${currCell}`)
		}
	}
}


const printMatrix = matrix => {
	for(let i = 0; i < matrix.length; i++) {
		let row = ""
		
		for (let j = 0; j < matrix[0].length; j++) {
			let currCell = matrix[i][j];
			if (j === 0) row += ' | ';
			row += currCell + ' | ';
			if (j === matrix[0].length - 1) row += "\n"
		}
		
		console.log(row);
	}	
}

const checkNumber = (num, currCell) => num === currCell;

const setNum = (matrix, num) => {
	var ignoreRow = [];
	var ignoreCol = [];
	printMatrix(matrix);

	console.log(' ---------------')


	for(let i = 0; i < matrix.length; i++) {
		for (let j = 0; j < matrix[0].length; j++) {
			let currCell = matrix[i][j];
			if ((!ignoreRow.includes(i) || !ignoreCol.includes(j)) && checkNumber(currCell, num)) {
				ignoreRow.push(i);
				ignoreCol.push(j);
			}
			if(ignoreRow.includes(i)) matrix[i][j] = num;
			if(ignoreCol.includes(j)) matrix[i][j] = num;
		}
	}
	printMatrix(matrix);
}

setNum(matrix, 1);
// traverseMatrix(x);
// printMatrix(x);

