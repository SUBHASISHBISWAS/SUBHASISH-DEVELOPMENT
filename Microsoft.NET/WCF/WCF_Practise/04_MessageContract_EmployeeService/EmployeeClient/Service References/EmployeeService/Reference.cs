﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EmployeeClient.EmployeeService {
    using System.Runtime.Serialization;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="EmployeeType", Namespace="http://schemas.datacontract.org/2004/07/EmployeeService")]
    public enum EmployeeType : int {
        
        [System.Runtime.Serialization.EnumMemberAttribute()]
        FullTimeEmployee = 1,
        
        [System.Runtime.Serialization.EnumMemberAttribute()]
        PartTimeEmployee = 2,
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="EmployeeService.IEmployeeService")]
    public interface IEmployeeService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEmployeeService/GetEmployee", ReplyAction="http://tempuri.org/IEmployeeService/GetEmployeeResponse")]
        EmployeeClient.EmployeeService.EmployeeInfo GetEmployee(EmployeeClient.EmployeeService.EmployeeRequest request);
        
        // CODEGEN: Generating message contract since the operation has multiple return values.
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEmployeeService/GetEmployee", ReplyAction="http://tempuri.org/IEmployeeService/GetEmployeeResponse")]
        System.Threading.Tasks.Task<EmployeeClient.EmployeeService.EmployeeInfo> GetEmployeeAsync(EmployeeClient.EmployeeService.EmployeeRequest request);
        
        // CODEGEN: Generating message contract since the operation SaveEmployee is neither RPC nor document wrapped.
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEmployeeService/SaveEmployee", ReplyAction="http://tempuri.org/IEmployeeService/SaveEmployeeResponse")]
        EmployeeClient.EmployeeService.SaveEmployeeResponse SaveEmployee(EmployeeClient.EmployeeService.EmployeeInfo request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEmployeeService/SaveEmployee", ReplyAction="http://tempuri.org/IEmployeeService/SaveEmployeeResponse")]
        System.Threading.Tasks.Task<EmployeeClient.EmployeeService.SaveEmployeeResponse> SaveEmployeeAsync(EmployeeClient.EmployeeService.EmployeeInfo request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(WrapperName="EmployeeRequestObject", WrapperNamespace="http://mycompany.com/Employee", IsWrapped=true)]
    public partial class EmployeeRequest {
        
        [System.ServiceModel.MessageHeaderAttribute(Namespace="http://mycompany.com/Employee")]
        public string LicenseKey;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://mycompany.com/Employee", Order=0)]
        public int EmployeeId;
        
        public EmployeeRequest() {
        }
        
        public EmployeeRequest(string LicenseKey, int EmployeeId) {
            this.LicenseKey = LicenseKey;
            this.EmployeeId = EmployeeId;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(WrapperName="EmployeeInfoObject", WrapperNamespace="http://mycompany.com/Employee", IsWrapped=true)]
    public partial class EmployeeInfo {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://mycompany.com/Employee", Order=0)]
        public int Id;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://mycompany.com/Employee", Order=1)]
        public string Name;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://mycompany.com/Employee", Order=2)]
        public string Gender;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://mycompany.com/Employee", Order=3)]
        public System.DateTime DOB;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://mycompany.com/Employee", Order=4)]
        public EmployeeClient.EmployeeService.EmployeeType Type;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://mycompany.com/Employee", Order=5)]
        public int AnnualSalary;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://mycompany.com/Employee", Order=6)]
        public int HourlyPay;
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="http://mycompany.com/Employee", Order=7)]
        public int HoursWorked;
        
        public EmployeeInfo() {
        }
        
        public EmployeeInfo(int Id, string Name, string Gender, System.DateTime DOB, EmployeeClient.EmployeeService.EmployeeType Type, int AnnualSalary, int HourlyPay, int HoursWorked) {
            this.Id = Id;
            this.Name = Name;
            this.Gender = Gender;
            this.DOB = DOB;
            this.Type = Type;
            this.AnnualSalary = AnnualSalary;
            this.HourlyPay = HourlyPay;
            this.HoursWorked = HoursWorked;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class SaveEmployeeResponse {
        
        public SaveEmployeeResponse() {
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IEmployeeServiceChannel : EmployeeClient.EmployeeService.IEmployeeService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class EmployeeServiceClient : System.ServiceModel.ClientBase<EmployeeClient.EmployeeService.IEmployeeService>, EmployeeClient.EmployeeService.IEmployeeService {
        
        public EmployeeServiceClient() {
        }
        
        public EmployeeServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public EmployeeServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public EmployeeServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public EmployeeServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        EmployeeClient.EmployeeService.EmployeeInfo EmployeeClient.EmployeeService.IEmployeeService.GetEmployee(EmployeeClient.EmployeeService.EmployeeRequest request) {
            return base.Channel.GetEmployee(request);
        }
        
        public int GetEmployee(string LicenseKey, int EmployeeId, out string Name, out string Gender, out System.DateTime DOB, out EmployeeClient.EmployeeService.EmployeeType Type, out int AnnualSalary, out int HourlyPay, out int HoursWorked) {
            EmployeeClient.EmployeeService.EmployeeRequest inValue = new EmployeeClient.EmployeeService.EmployeeRequest();
            inValue.LicenseKey = LicenseKey;
            inValue.EmployeeId = EmployeeId;
            EmployeeClient.EmployeeService.EmployeeInfo retVal = ((EmployeeClient.EmployeeService.IEmployeeService)(this)).GetEmployee(inValue);
            Name = retVal.Name;
            Gender = retVal.Gender;
            DOB = retVal.DOB;
            Type = retVal.Type;
            AnnualSalary = retVal.AnnualSalary;
            HourlyPay = retVal.HourlyPay;
            HoursWorked = retVal.HoursWorked;
            return retVal.Id;
        }
        
        public System.Threading.Tasks.Task<EmployeeClient.EmployeeService.EmployeeInfo> GetEmployeeAsync(EmployeeClient.EmployeeService.EmployeeRequest request) {
            return base.Channel.GetEmployeeAsync(request);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        EmployeeClient.EmployeeService.SaveEmployeeResponse EmployeeClient.EmployeeService.IEmployeeService.SaveEmployee(EmployeeClient.EmployeeService.EmployeeInfo request) {
            return base.Channel.SaveEmployee(request);
        }
        
        public void SaveEmployee(int Id, string Name, string Gender, System.DateTime DOB, EmployeeClient.EmployeeService.EmployeeType Type, int AnnualSalary, int HourlyPay, int HoursWorked) {
            EmployeeClient.EmployeeService.EmployeeInfo inValue = new EmployeeClient.EmployeeService.EmployeeInfo();
            inValue.Id = Id;
            inValue.Name = Name;
            inValue.Gender = Gender;
            inValue.DOB = DOB;
            inValue.Type = Type;
            inValue.AnnualSalary = AnnualSalary;
            inValue.HourlyPay = HourlyPay;
            inValue.HoursWorked = HoursWorked;
            EmployeeClient.EmployeeService.SaveEmployeeResponse retVal = ((EmployeeClient.EmployeeService.IEmployeeService)(this)).SaveEmployee(inValue);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<EmployeeClient.EmployeeService.SaveEmployeeResponse> EmployeeClient.EmployeeService.IEmployeeService.SaveEmployeeAsync(EmployeeClient.EmployeeService.EmployeeInfo request) {
            return base.Channel.SaveEmployeeAsync(request);
        }
        
        public System.Threading.Tasks.Task<EmployeeClient.EmployeeService.SaveEmployeeResponse> SaveEmployeeAsync(int Id, string Name, string Gender, System.DateTime DOB, EmployeeClient.EmployeeService.EmployeeType Type, int AnnualSalary, int HourlyPay, int HoursWorked) {
            EmployeeClient.EmployeeService.EmployeeInfo inValue = new EmployeeClient.EmployeeService.EmployeeInfo();
            inValue.Id = Id;
            inValue.Name = Name;
            inValue.Gender = Gender;
            inValue.DOB = DOB;
            inValue.Type = Type;
            inValue.AnnualSalary = AnnualSalary;
            inValue.HourlyPay = HourlyPay;
            inValue.HoursWorked = HoursWorked;
            return ((EmployeeClient.EmployeeService.IEmployeeService)(this)).SaveEmployeeAsync(inValue);
        }
    }
}
