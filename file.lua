--[[

  Copyright (C) 2016 Masatoshi Teruya

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.

  file.lua
  lua-writelog-file
  Created by Masatoshi Teruya on 16/07/07.

--]]

-- assign to local
local writelog = require('writelog');
local open = io.open;


local function writer( ctx, ... )
    ctx.fh:write( ... );
end


local function close( ctx )
    ctx.fh:close();
    return true;
end


--- new
-- @param lv
-- @param ctx
-- @param opts
-- @return logger
-- @return err
local function new( lv, ctx, opts )
    local formatter = opts and opts.formatter;
    local err;

    ctx.fh, err = open( ctx.path, 'a' );
    if err then
        return nil, err;
    end
    ctx.close = close;

    -- set to no buffering mode
    ctx.fh:setvbuf('no');

    return writelog.create( ctx, lv, writer, formatter );
end


-- exports
return {
    new = new
};
