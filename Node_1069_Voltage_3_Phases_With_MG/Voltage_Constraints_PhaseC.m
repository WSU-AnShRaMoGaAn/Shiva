function [Volt1,Volt2, Vp_A, Vq_A,Vp_B, Vq_B,Vp_C, Vq_C,vec2,store]=Voltage_Constraints_PhaseC(edges1,line,nEdges,G1,Source,swtch,nNodes,nSwitches)   
    v1=dfsearch(G1,Source);
    Volt1=zeros(nEdges,nSwitches*2);
    Vp_A=zeros(nEdges,nEdges);
    Vq_A=zeros(nEdges,nEdges);
    Vp_B=zeros(nEdges,nEdges);
    Vq_B=zeros(nEdges,nEdges);
    Vp_C=zeros(nEdges,nEdges);
    Vq_C=zeros(nEdges,nEdges);
    fr=edges1(:,1);
    t=edges1(:,2);
    Volt2=zeros(nEdges,nNodes);
    p=1;
    vec2=[]; 
    store=[];
    for i=1:nEdges
        flag=0;       
        %% 
        %%         
        a=t(i); b=fr(i);
        see=find(a==swtch(:,1));        
        for m=1:size(see,1)
            if b==swtch(see(m),2)
                vec2=[vec2 t(i) fr(i)];   
                store=[store p p+1];
                flag=1;
                Volt1(i,p)=-1;
                Volt1(i,p+1)=1;
                  p=p+2;
                break;
                
            end    
        end        
        see=find(a==swtch(:,2));               
        for m=1:size(see,1)
            if b==swtch(see(m),1)
               vec2=[vec2 t(i) fr(i)];
               store=[store p p+1];
               flag=1;
                Volt1(i,p)=-1;
                Volt1(i,p+1)=1;
                  p=p+2;
               break;                
            end    
        end        
        %% 
        %%         
        res=find (line(:,1)==fr(i));        
        for k=1:size(res)
            if line(res(k),2)==t(i)
                code=line(res(k),5);
                len=line(res(k),3);
            end
        end         
         res=find (line(:,2)==fr(i));
         for k=1:size(res)
           if line(res(k),1)==t(i)
                code=line(res(k),5);
                len=line(res(k),3);
           end
         end  
       [r_cc,x_cc,r_cb,x_cb,r_ac,x_ac]=configurations(code);

         
        Vp_A(i,i)=(r_ac+sqrt(3)*x_ac)*len/(5280*155.5*1000);
        Vq_A(i,i)=(x_ac-sqrt(3)*r_ac)*len/(5280*155.5*1000);
        
        Vp_B(i,i)=(r_cb-sqrt(3)*x_cb)*len/(5280*155.5*1000);
        Vq_B(i,i)=(x_cb+sqrt(3)*r_cb)*len/(5280*155.5*1000);
        
        Vp_C(i,i)=-2*r_cc*len/(5280*155.5*1000);
        Vq_C(i,i)=-2*x_cc*len/(5280*155.5*1000);      
        
        if flag==0
            Volt2(i,t(i))=-1;
            Volt2(i,fr(i))=1;
        end

    end  
end




  