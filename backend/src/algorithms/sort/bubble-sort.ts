export type SortAction = 'start' | 'compare' | 'swap' | 'done';

export interface Iteration {
  step: number;
  action: SortAction;
  array: number[];
  elemIndexes?: number[];
}

export function bubbleSort(array: number[]): Iteration[] {
  const iterations: Iteration[] = [];
  const arr = [...array];
  let stepCounter = 0;
  let isSwapped;

  iterations.push({
    step: ++stepCounter,
    action: 'start',
    array: [...arr],
    elemIndexes: [],
  });

  for (let i = 0; i < arr.length; i++) {
    isSwapped = false;

    for (let j = 0; j < arr.length - i - 1; j++) {
      iterations.push({
        step: ++stepCounter,
        action: 'compare',
        array: [...arr],
        elemIndexes: [j, j + 1],
      });

      if (arr[j] > arr[j + 1]) {
        [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]];
        isSwapped = true;

        iterations.push({
          step: ++stepCounter,
          action: 'swap',
          array: [...arr],
          elemIndexes: [j, j + 1],
        });
      }
    }

    if (!isSwapped) break;
  }

  iterations.push({
    step: ++stepCounter,
    action: 'done',
    array: [...arr],
  });

  return iterations;
}

const sortedArray = bubbleSort([45, 23, 3, 5346, 5, 356]);
console.log(sortedArray);
