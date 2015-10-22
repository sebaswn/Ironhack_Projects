
hash = {
	:wat => [
		0,
		1,
		{
				:wut => [
					0,
					[
						[
							0,
							1,
							2,
							3,
							4,
							5,
							6,
							7,
							8,
							{
								:bbq => "This is working!"
							}
							
						]
					]
				]
			}
		]
	}

puts hash[:wat][2][:wut][1][0][9][:bbq]

arr = [
	[
		0,
		1,
		2,
		3,
		4,
		{
			:secret => {
							:unlock => [
										0,
										"yay!!"
										]
						}
		}
	]	
]

puts arr[0][5][:secret][:unlock][1]
