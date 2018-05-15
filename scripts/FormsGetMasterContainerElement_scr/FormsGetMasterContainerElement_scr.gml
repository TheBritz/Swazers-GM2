/// @description FormsGetMasterContainerElement_scr(element, returnEmbeddingDepthToo [optional])
/// @param element
/// @param  returnEmbeddingDepthToo [optional]
//The master container element is the container element at the "end" of the 
//chain. The master container has no container element.

var element = argument[0];
var retDepth = false;
if(argument_count > 1)
{
  retDepth = argument[1];
}

var embedDepth = 0;
var container = element;
while(instance_exists(container.m_containerElement))
{
  embedDepth++;
  container = container.m_containerElement;
}

if(retDepth)
{
  return array(container, embedDepth);  
}
else
{
  return container;
}
