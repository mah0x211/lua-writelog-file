# lua-writelog-file

file logger module of writelog.


## Dependencies

- writelog: https://github.com/mah0x211/lua-writelog

## Installation

```
luarocks install writelog-file --from=http://mah0x211.github.io/rocks/
```


## Creating an instance of file logger

### logger, err = writelog.new( [loglevel], pathname, opts )

returns a logger

**Parameters**

- `loglevel:number`: log level constants (default: `WARNING`)
- `pathname:string`: pathname that scheme must be `file://`
- `opts:table`: optional arguments
  - `formatter:callable`: custom log formatter


**Returns**

1. `logger:table`: instance of writelog logger
2. `err:string` error message



## Usage

```lua
local unpack = unpack or table.unpack;
local writelog = require('writelog');
local logger = writelog.new( writelog.DEBUG, 'file://./test.log' );
local args = {
    'hello',
    0,
    1,
    -1,
    1.2,
    'world',
    {
        foo = 'bar',
        baz = {
            x = {
                y = 'z'
            }
        }
    },
    true,
    function()end,
    coroutine.create(function()end)
};

logger:warn( unpack( args ) )
logger:notice( unpack( args ) )
logger:verbose( unpack( args ) )
logger:debug( unpack( args ) )
logger:close();
```

