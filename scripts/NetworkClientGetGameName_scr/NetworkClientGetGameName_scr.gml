/// @description NetworkClientCreateGame_scr(client)
/// @param client
var client = argument0;

with(client)
{
  if(other.text == "Create Game")
  {
    dialogID = get_string_async("Enter New Game Name:", "");
  }
  else if(other.text == "Join Game")
  {
    dialogJoinID = get_string_async("Enter Game Name to Join:", "");
  }
}
