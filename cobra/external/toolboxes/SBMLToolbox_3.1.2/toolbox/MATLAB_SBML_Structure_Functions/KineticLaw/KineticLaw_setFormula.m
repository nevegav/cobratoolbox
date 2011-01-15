function SBMLKineticLaw = KineticLaw_setFormula(SBMLKineticLaw, formula)
%
%   KineticLaw_setFormula 
%             takes  1) an SBMLKineticLaw structure 
%             and    2) a string representing the formula to be set
%
%             and returns 
%               the kineticLaw with the formula set
%
%       SBMLKineticLaw = KineticLaw_setFormula(SBMLKineticLaw, 'formula')

%  Filename    :   KineticLaw_setFormula.m
%  Description :
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  $Id: KineticLaw_setFormula.m 7155 2008-06-26 20:24:00Z mhucka $
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



% check that input is correct
if (~isstruct(SBMLKineticLaw))
  error(sprintf('%s\n%s', ...
    'KineticLaw_setFormula(SBMLKineticLaw, .)', ...
    'first argument must be an SBML KineticLaw structure'));
end;
 
[sbmlLevel, sbmlVersion] = GetLevelVersion(SBMLKineticLaw);

if (~isSBML_KineticLaw(SBMLKineticLaw, sbmlLevel, sbmlVersion))
    error(sprintf('%s\n%s', 'KineticLaw_setFormula(SBMLKineticLaw, formula)', 'first argument must be an SBML kineticLaw structure'));
elseif (~ischar(formula))
    error(sprintf('KineticLaw_setFormula(SBMLKineticLaw, formula)\n%s', 'second argument must be a string representing the formula of the kineticLaw'));
end;

SBMLKineticLaw.formula = formula;