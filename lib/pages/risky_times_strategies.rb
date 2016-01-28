# page object for risky times strategies
class RiskyTimesStrategy
  include Capybara::DSL

  def open
    find('.btn-primary', text: 'help me choose a strategy').click
  end

  def exit
    find('button', text: 'CLOSE').click
  end

  def close_strategy_help
    all('button', text: 'CLOSE')[1].click
  end

  def open_negative_emotions_strategy
    find('.btn-primary', text: 'NEGATIVE EMOTIONS').click
  end

  def has_negative_strategy_present?
    has_css?('.modal-body',
             text: 'Exercise - it will help you unwind. Doing something ' \
                   'healthy makes smoking seem a bit weird. Why smoke after ' \
                   'doing something good for you?')
    has_css?('.modal-body',
             text: 'Socialize - call a friend, go out, chat online, try to ' \
                   'meet someone new without cigarettes')
    has_css?('.modal-body',
             text: 'Do something pleasant - cuddle with your cat, read a ' \
                   'book, draw a picture or make something, cook your ' \
                   'favorite meal , watch a funny video online, listen to ' \
                   'music')
    has_css?('.modal-body',
             text: 'Do something kind – repeat an act of kindness you have ' \
                   'seen or done yourself (as logged in this app), write ' \
                   'something nice on social media for a friend, go to ' \
                   'freerice.com, a site that donates food for playing ' \
                   'vocab games')
    has_css?('.modal-body',
             text: 'Distract yourself - play games on your phone, do a ' \
                   'crossword puzzle or Soduku, try some trivia on sporcle.com')
    has_css?('.modal-body',
             text: 'Remember self-care - you\'ll be better able to regulate ' \
                   'your emotions if you are getting plenty of rest, eating ' \
                   'well, taking time for yourself, and drinking fluids')
  end

  def open_positive_emotions_strategy
    find('.btn-primary', text: 'POSITIVE EMOTIONS').click
  end

  def has_positive_strategy_present?
    has_css?('.modal-body',
             text: 'Treat yourself – try a non-lethal replacement treat - ' \
                   'tea, hot chocolate, ice-cream, nachos')
    has_css?('.modal-body',
             text: 'Savor - just savor the moment for its own merit. For ' \
                   'example, you don\'t need a cigarette to celebrate the ' \
                   'weekend, it\'s fun on its own')
    has_css?('.modal-body',
             text: 'Share your happiness – reach out to the people in your ' \
                   'life and share your happiness - call, email, text, chat ' \
                   'online, and/or meet your family and friends to share the ' \
                   'moment')
    has_css?('.modal-body',
             text: 'Realize there is plenty more - Think of how much longer ' \
                   'you\'ll be able to enjoy these joyful moments by not ' \
                   'smoking - you\'ll have a longer, healthier life!')
  end

  def open_social_situations_strategy
    find('.btn-primary', text: 'SOCIAL SITUATIONS').click
  end

  def has_social_strategy_present?
    has_css?('.modal-body',
             text: 'Say “no, thanks” - when offered a cigarette, say "no ' \
                   'thanks, I don’t smoke anymore"')
    has_css?('.modal-body',
             text: 'Enlist a friend to help - before being offered a ' \
                   'cigarette, ask your friend(s) to say "no" for you')
    has_css?('.modal-body',
             text: 'Be elsewhere - simply avoid the situation (not forever, ' \
                   'just for the first 1-2 weeks during which you practice ' \
                   '– and perfect – being smoke-free!)')
    has_css?('.modal-body',
             text: 'Keep your hands busy - when feeling awkward without a ' \
                   'cigarette, keep your hands busy. Drink a glass of water, ' \
                   'chew on a snack, play with your smartphone (you can even ' \
                   'show off this app!)')
    has_css?('.modal-body',
             text: 'Stay inside - when others go outside to smoke, stay ' \
                   'inside; ask a friend to stay inside with you for the ' \
                   'night. This will be an easy one in bad weather!')
    has_css?('.modal-body',
             text: 'Realize you are helping others - you are helping others ' \
                   'by not smoking - you\'re an example for smokers of how to' \
                   ' quit, you\'re not harming others with second-hand smoke,' \
                   ' you\'re not making others smell cigarettes')
    has_css?('.modal-body',
             text: 'Plan smoke-free outings - Ask to go out where you ' \
                   'can\'t smoke - the movies, library, restaurant or ' \
                   'coffee shop, bowling alley, zoo')
  end

  def open_drinking_alcohol_strategy
    find('.btn-primary', text: 'DRINKING ALCOHOL').click
  end

  def has_alcohol_strategy_present?
    has_css?('.modal-body',
             text: 'Avoid drinking– if drinking is an important part of your ' \
                   'social life, that\'s tough to do, but best: your ' \
                   'cravings will be less strong if you are simply not ' \
                   'drinking. Remember, it’s not forever, just while you are ' \
                   'getting used to being smoke-free (2-3 weeks)')
    has_css?('.modal-body',
             text: 'Trash the smoking supplies - make sure you have no ' \
                   'cigarettes or lighters on you, get rid of ashtrays and ' \
                   'cigarette cases')
    has_css?('.modal-body',
             text: 'Enlist friends’ help - Ask your friends ahead of time ' \
                   'not to give you any cigarettes, even if you ask')
    has_css?('.modal-body',
             text: 'Stay inside - when others go outside to smoke, stay ' \
                   'inside; ask a friend to stay inside with you for the night')
    has_css?('.modal-body',
             text: 'Arrange for activities - if you are going out, try ' \
                   'somewhere that has activities (darts, pool, video ' \
                   'games, dancing), so you won\'t feel awkward or ' \
                   'bored staying inside')
  end

  def open_habitual_smoking_strategy
    find('.btn-primary', text: 'HABITUAL SMOKING').click
  end

  def has_habitual_smoking_strategy_present?
    has_css?('.modal-body',
             text: 'Change your routine - take a different route to work, go ' \
                   'for a walk as your break, drink a juice instead of a ' \
                   'coffee or change your coffee flavor/shop')
    has_css?('.modal-body',
             text: 'Change what you do right after - for example, after a ' \
                   'meal, get up from the table immediately and do a ' \
                   'different activity for five minutes, sit in a different ' \
                   'room before cleaning up, call a friend')
    has_css?('.modal-body',
             text: 'Use mints - they\'ll make you not want to smoke, mixing ' \
                   'mint and cigarettes tastes gross!')
    has_css?('.modal-body',
             text: 'Chew on something – carrots, celery, nuts are wonderful')
  end

  def open_hands_strategy
    find('.btn-primary',
         text: 'WANTING SOMETHING TO DO WITH YOUR HANDS').click
  end

  def has_hands_strategy_present?
    has_css?('.modal-body',
             text: 'Bring something else - have a stress ball, worry stone, ' \
                   'silly putty, play dough to keep your hands busy')
    has_css?('.modal-body',
             text: 'Make coffee or tea – just the motions of making yourself ' \
                   'a nice drink can be soothing')
    has_css?('.modal-body',
             text: 'Use hand lotion – your hands will appreciate it and you ' \
                   'will be distracted')
    has_css?('.modal-body',
             text: 'Engage in an activity - Draw, cook, play cards or start ' \
                   'a new hobby')
  end
end
