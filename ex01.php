<?php
	
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);

	class arrUnion
	{
		private $arr1;
		private $arr2;
		function __construct($a, $b)
		{
			$this->arr1 = $a;
			$this->arr2 = $b;
		}
		
		function getUnion() {
			$result = [];
			if (current($this->arr1))
				$result[] = current($this->arr1);
			if (current($this->arr2))
				$result[] = current($this->arr2);
			
			while (current($this->arr1) || (current($this->arr2))) {
				next($this->arr1);
				next($this->arr2);
				if (current($this->arr1))
					$result[] = current($this->arr1);
				if (current($this->arr2))
					$result[] = current($this->arr2);
			}
			reset($this->arr1);
			reset($this->arr2);
			return $result;
		}
		
	}
	
	$arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,];
	$arr2 = ['q', 'w', 'e', 'r', 't', 'y', 'u', 'q', 'w', 'e', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'q', 'w', 'e', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'q', 'w', 'e',];
	
//	$arr1 = [
//		0 => '1',
//		'a' => '2',
//		1 => '3'
//	];
	
	$arrUnion = new arrUnion($arr1, $arr2);
	$result = $arrUnion->getUnion();
	var_dump($arr1);
	var_dump($arr2);
	var_dump($result);
	
	
	/* " массивы должны иметь одинаковое количество элементов."
			Я не совсем понял, нужно ли мне именно проверять одинкаовое ли количество елементов, и отказывать ли в
			случае если они не равны, потому работает с разным количеством елементов */
	