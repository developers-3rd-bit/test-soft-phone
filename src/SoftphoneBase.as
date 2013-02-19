package
{
	// import com.halcyon.core.audioConferencing.softphone.SoftphoneManager;
	// import com.halcyon.core.audioConferencing.softphone.net.SipClient;
	import com.halcyon.core.user.AvatarManager;
	import com.halcyon.core.user.User;
	import com.halcyon.message.ref.UserRef;
	import com.halcyon.util.utilities.ContextManager;
	
	import flash.events.Event;
	
	import spark.components.Application;
	import spark.components.CheckBox;
	import spark.components.Label;
	import spark.components.NumericStepper;
	import spark.components.TextArea;
	import spark.components.TextInput;

	public class SoftphoneBase extends Application
	{
		
		[Bindable] public var sipHost:TextInput;
		[Bindable] public var u_id:TextInput;
		[Bindable] public var sipRtmp:TextInput;
		[Bindable] public var userName:TextInput;
		[Bindable] public var password:TextInput;
		[Bindable] public var passCode:TextInput;
		[Bindable] public var tollPhone:TextInput;
		[Bindable] public var encodingQlty:NumericStepper;
		public var log:TextArea;
		public var sendText:TextArea;
		// public static var spm:SoftphoneManager;
		
		public function SoftphoneBase() {}
		
		// private var _sipClient:SipClient;
		
		protected function init():void
		{
			ContextManager.getInstance().context = "IMEET";
			
			var userRef:UserRef = new UserRef();
			userRef.setFirstName("John");
			userRef.setLastName("Doe");
			userRef.setTitle("Designer");
			userRef.setAbout("Likes football");
			userRef.setCompany("PGI");
			userRef.setLocation("Atlanta, Georgia");
			userRef.setEmail("john.doe@gmail.com");
			// Util.iMeetTitleFormat(testUser1.getCompany());
			
			var user:User = User.getUser(userRef);
				
			AvatarManager.getInstance().setMyUser(user);
			
			// spm = SoftphoneManager.getInstance();
			// spm.textLogger = log;
			// SoftphoneManager.SIP_URIS = [sipRtmp.text];
			
			// _sipClient = new SipClient(sipHost.text, u_id.text, tollPhone.text, userName.text, password.text, passCode.text, sipHost.text, "", sipRtmp.text);			
		}

		protected function onConnect(i:Event=null):void
		{
			// _sipClient.connect();
		}						
		
		protected function onClear(i:Event=null):void
		{
			log.text = "";
		}

		protected function onMute(i:Event=null):void
		{
			logger("Muting...");
			// spm.hangup();
		}		

		protected function onSendInfo(i:Event=null):void
		{
			logger("Sending info...");
			// spm.sendConnectionInfo();
		}				

		protected function onDisconnect(i:Event=null):void
		{
			logger("Disconnecting...");
			// spm.hangup();
			// spm.closeNetConnection();			
		}						

		protected function onSilentReconnect(i:Event=null):void
		{
			logger("Silently rconnecting...");
		}								

		protected function onEnhancedMic(e:Event):void
		{
			logger("Enhanced mic selected: " + (e.target as CheckBox).selected);
		}										

		protected function onEnhancedMicMode(i:Event=null):void
		{
			logger("Enhanced mic option");
		}												
		
		protected function onSendText(i:Event=null):void
		{
			var txt:String = sendText.text;
			sendText.text = "";
			logger("Sending [" + txt + "]");
			// spm.onBadCall();
			// spm.onSendComment(txt);
		}

		protected function onDialPad(e:Event):void
		{
			var dialString:String = "";
			
			if (e.target is DialPadButton)
			{
				dialString = (e.target as DialPadButton).label;
				sendDialPad(e, dialString);
			}
			else if (e.target is Label)
			{
				dialString = (e.target as Label).text;
				sendDialPad(e, dialString);
			}
		}
		
		private function sendDialPad(e:Event, value:String):void
		{
			logger("Sending [" + value + "]");
			e.stopImmediatePropagation();
			// spm.doCallChar(value);
		}
		
		private function logger(value:String):void
		{
			log.appendText("\n");
			log.appendText(value);
		}
	
	}
}