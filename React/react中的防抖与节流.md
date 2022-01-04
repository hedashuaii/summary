```ts
import { useRef, useEffect, useCallback } from 'react'

interface Content {
  fn: Function
  timer?: NodeJS.Timeout
}

export function useDebounce (fn, delay, dep = []) {
  const { current } = useRef<Content>({ fn })

  useEffect(() => current.fn = fn, [fn])

  return useCallback((...args) => {
    current.timer && clearTimeout(current.timer)
    current.timer = setTimeout(() => {
      current.fn.call(this, ...args)
    }, delay)
  }, dep)
}
```

