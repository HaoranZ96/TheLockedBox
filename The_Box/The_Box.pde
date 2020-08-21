import twitter4j.*;
import guru.ttslib.*;

TwitterStream twitterStream;
TTS actor;
String text;

void setup() {
  openTwitter();
  actor = new TTS();
}  

void draw() {}

void openTwitter() {
  
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("***");
  cb.setOAuthConsumerSecret("***");
  cb.setOAuthAccessToken("***");
  cb.setOAuthAccessTokenSecret("***");
  
  TwitterStream twitterStream = new TwitterStreamFactory(cb.build()).getInstance();

  FilterQuery filtered = new FilterQuery();
  
  String keywords[] = {
    "#thelockedbox"
  };
  filtered.track(keywords);
  
  twitterStream.addListener(listener);
  
  if (keywords.length == 0) {
    twitterStream.sample();
  } else {
    twitterStream.filter(filtered);
  }
}

StatusListener listener = new StatusListener() {
  
  //Success
  public void onStatus(Status status) {
    System.out.println(status.getUser().getScreenName() + status.getText());
    passText(status);
  }
  
  //Different Failures
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
    System.out.println("Status Deletion Notice" + statusDeletionNotice);
  }
  
  public void onScrubGeo(long userID, long upToStatusID) {
    System.out.println("Get Scrub Notice" + userID + "Up to Status" + upToStatusID);
  }
  
  public void onTrackLimitationNotice(int numberOfLimitationStatus) {
    System.out.println("Track Limitation" + numberOfLimitationStatus);
  }
  
  public void onStallWarning(StallWarning warning) {
    System.out.println("Warning" + warning);
  }
  
  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};

void passText (Status status) {
  String content = status.getText();
  text = content;
  actor.speak(text);
  text = null;
}
