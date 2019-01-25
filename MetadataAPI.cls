public class MetadataAPI {
 public static void listMetadata()
	{
        MetadataService.MetadataPort service = createService();
		// Read WorkflowAlert
        MetadataService.WorkflowAlert workflowalert = (MetadataService.WorkflowAlert) service.readMetadata('WorkflowAlert',
                new String[] { 'Lead.Email_notification_when_new_lead_is_created' }).getRecords()[0];
        System.debug(workflowalert.fullName);
        System.debug(workflowalert.ccEmails);
        workflowalert.ccEmails = new String[]{'najeeb.khan12@outlook.com','khannajeeb362@gmail.com'};
        MetadataService.SaveResult result = service.updateMetadata(new List<MetadataService.Metadata> { workflowalert })[0];
        if (result.success){
            System.debug('Workflowalert Updated successfully: '+result.fullName);
        }
        
        else
        {
            System.debug('Updation was unsuccessfull');
        }
	}
	
	public static MetadataService.MetadataPort createService()
	{ 
		MetadataService.MetadataPort service = new MetadataService.MetadataPort();
		service.SessionHeader = new MetadataService.SessionHeader_element();
		service.SessionHeader.sessionId = UserInfo.getSessionId();
		return service;		
	}
}