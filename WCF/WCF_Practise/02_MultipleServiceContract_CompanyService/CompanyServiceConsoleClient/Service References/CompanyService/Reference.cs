﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CompanyServiceConsoleClient.CompanyService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="CompanyService.ICompanyPublicService")]
    public interface ICompanyPublicService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICompanyPublicService/GetPublicInformation", ReplyAction="http://tempuri.org/ICompanyPublicService/GetPublicInformationResponse")]
        string GetPublicInformation();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICompanyPublicService/GetPublicInformation", ReplyAction="http://tempuri.org/ICompanyPublicService/GetPublicInformationResponse")]
        System.Threading.Tasks.Task<string> GetPublicInformationAsync();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ICompanyPublicServiceChannel : CompanyServiceConsoleClient.CompanyService.ICompanyPublicService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class CompanyPublicServiceClient : System.ServiceModel.ClientBase<CompanyServiceConsoleClient.CompanyService.ICompanyPublicService>, CompanyServiceConsoleClient.CompanyService.ICompanyPublicService {
        
        public CompanyPublicServiceClient() {
        }
        
        public CompanyPublicServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public CompanyPublicServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public CompanyPublicServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public CompanyPublicServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string GetPublicInformation() {
            return base.Channel.GetPublicInformation();
        }
        
        public System.Threading.Tasks.Task<string> GetPublicInformationAsync() {
            return base.Channel.GetPublicInformationAsync();
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="CompanyService.ICompanyCofidentialService")]
    public interface ICompanyCofidentialService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICompanyCofidentialService/GetConfidentialInformation", ReplyAction="http://tempuri.org/ICompanyCofidentialService/GetConfidentialInformationResponse")]
        string GetConfidentialInformation();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICompanyCofidentialService/GetConfidentialInformation", ReplyAction="http://tempuri.org/ICompanyCofidentialService/GetConfidentialInformationResponse")]
        System.Threading.Tasks.Task<string> GetConfidentialInformationAsync();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ICompanyCofidentialServiceChannel : CompanyServiceConsoleClient.CompanyService.ICompanyCofidentialService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class CompanyCofidentialServiceClient : System.ServiceModel.ClientBase<CompanyServiceConsoleClient.CompanyService.ICompanyCofidentialService>, CompanyServiceConsoleClient.CompanyService.ICompanyCofidentialService {
        
        public CompanyCofidentialServiceClient() {
        }
        
        public CompanyCofidentialServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public CompanyCofidentialServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public CompanyCofidentialServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public CompanyCofidentialServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string GetConfidentialInformation() {
            return base.Channel.GetConfidentialInformation();
        }
        
        public System.Threading.Tasks.Task<string> GetConfidentialInformationAsync() {
            return base.Channel.GetConfidentialInformationAsync();
        }
    }
}
