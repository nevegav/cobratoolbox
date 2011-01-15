function SpeciesType = SpeciesType_create(varargin)
%
%   SpeciesType_create 
%             optionally takes an SBML level
%             optionally takes an SBML version
%
%             and returns 
%               a SpeciesType structure of the required level and version
%               (default level = 2 version = 4)
%
%       SpeciesType = SpeciesType_create
%    OR SpeciesType = SpeciesType_create(sbmlLevel)
%    OR SpeciesType = SpeciesType_create(sbmlLevel, sbmlVersion)

%  Filename    :   SpeciesType_create.m
%  Description :
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  $Id: SpeciesType_create.m 10315 2009-11-25 12:14:39Z sarahkeating $
%  $Source v $
%
%<!---------------------------------------------------------------------------
% This file is part of SBMLToolbox.  Please visit http://sbml.org for more
% information about SBML, and the latest version of SBMLToolbox.
%
% Copyright 2005-2007 California Institute of Technology.
% Copyright 2002-2005 California Institute of Technology and
%                     Japan Science and Technology Corporation.
% 
% This library is free software; you can redistribute it and/or modify it
% under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation.  A copy of the license agreement is provided
% in the file named "LICENSE.txt" included with this software distribution.
% and also available online as http://sbml.org/software/sbmltoolbox/license.html
%----------------------------------------------------------------------- -->



%default level = 2
%default version = 4
sbmlLevel = 2;
sbmlVersion = 4;

if (nargin > 2)
  error(sprintf('%s\n%s\n%s', ...
    'SpeciesType_create(sbmlLevel, sbmlVersion)', ...
    'requires either zero, one or two arguments', ...
    'SEE help SpeciesType_create'));

elseif (nargin == 2)
  if ((~isIntegralNumber(varargin{1})) || (varargin{1} ~= 2))
    error(sprintf('%s\n%s', 'SpeciesType_create(sbmlLevel, sbmlVersion)', ...
      'first argument must be SBML level 2'));
  elseif ((~isIntegralNumber(varargin{2})) || (varargin{2} < 2) || (varargin{2} > 4))
    error(sprintf('%s\n%s', 'SpeciesType_create(sbmlLevel, sbmlVersion)', ...
      'second argument must be a valid SBML version i.e. either 2 or 3'));
  end;
  
  sbmlVersion = varargin{2};
    
elseif (nargin == 1)
  if ((~isIntegralNumber(varargin{1})) || (varargin{1} ~= 2))
    error(sprintf('%s\n%s', 'SpeciesType_create(sbmlLevel)', ...
      'argument must be SBML level 2'));
  end;
end;

if exist('OCTAVE_VERSION')
  warning off Octave:divide-by-zero;
else
  warning off MATLAB:divideByZero;
end;

if (sbmlVersion == 2)
  SBMLfieldnames = {'typecode', 'metaid', 'notes', 'annotation', 'name', 'id'};
  Values = {'SBML_SPECIES_TYPE', '', '', '', '', ''};
elseif (sbmlVersion > 2)
  SBMLfieldnames = {'typecode', 'metaid', 'notes', 'annotation', 'sboTerm', 'name', 'id'};
  Values = {'SBML_SPECIES_TYPE', '', '', '', int32(-1), '', ''};
end;

SpeciesType = cell2struct(Values, SBMLfieldnames, 2);

if exist('OCTAVE_VERSION')
  warning off Octave:divide-by-zero;
else
  warning off MATLAB:divideByZero;
end;

%check created structure is appropriate
if (~isSBML_SpeciesType(SpeciesType, sbmlLevel, sbmlVersion))
    SpeciesType = [];
    warning('Failed to create SpeciesType');
end;