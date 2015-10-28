var numbers = '80:70:90:100:105:2';


function statsColon(nums) {
	var array = nums.split(":");
	var i = 0;
	var total = 0;
	var avg_int = 0;
	var max_int = 0;
	var min_int = 0;
	var int_array_one = [];
	var int_array_two = [];
	var x = 0;

	while (i < array.length) {
		total = total + parseInt(array[i]);
		i++;
	};

	while (x < array.length) {
		int_array_one.push(parseInt(array[x]));
		int_array_two.push(parseInt(array[x]));
		
		x++;
	};

	max_int = int_array_one.sort(function(a, b){return b-a});
	min_int = int_array_two.sort(function(a, b){return a-b});

	avg_int = (total / array.length);

	var info = {
		max: max_int[0],
		min: min_int[0],
		avg: avg_int
	};

	return info;
}


var stats = statsColon(numbers);

console.log(stats.max);
console.log(stats.min);
console.log(stats.avg);





