/// @description IsLegalFormsElement_scr(element)
/// @param element

var element = argument0;
return instance_exists(element) && 
   object_is(element.object_index, FormsElementBase_obj);
