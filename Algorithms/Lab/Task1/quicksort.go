package main

func QuickSort(nums []int) {
	var sort func([]int, int, int)
	sort = func(nums []int, low, high int) {
		if low < high {
			p := partition(nums, low, high)
			sort(nums, low, p)
			sort(nums, p+1, high)
		}
	}
	sort(nums, 0, len(nums)-1)
}

func partition(nums []int, low, high int) int {
	pivot := nums[(low + high) / 2]
	i, j := low, high

	for {
		for nums[i] < pivot {
			i++
		}
		for nums[j] > pivot {
			j--
		}
		if i >= j {
			return j
		}
		nums[i], nums[j] = nums[j], nums[i]
	}
}