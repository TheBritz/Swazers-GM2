/// @description InteractibleInteract_scr(interactor, interactibleInstance)
/// @param interactor
/// @param  interactibleInstance

var interactor = argument0;
var interactible = argument1;

with(interactible)
{
  script_execute(m_interactScript, interactor, m_interactArgs);
}
