## Copyright (C) 2019 mosta
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} LPF (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mosta <mosta@DESKTOP-4LJLPCB>
## Created: 2019-04-29

function retval = LPF (alpha,input1)
  filtInt = input1(1)-1.5;

  
  for ii = 2:1:length(input1)
    filtInt(ii) = ((filtInt(ii-1) + alpha*(input1(ii) - filtInt(ii-1))) );
    
  endfor
  retval = filtInt;

endfunction
