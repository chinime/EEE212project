function [B,C] = FStamp(B, C, numV)
global t1;
%     numv_thus_far = numV;
%     for i = 1 : size(t1, 1)
%         temp = char(t1.element(i));
%         x = temp(1);
%         if x == 'F'
%             numv_thus_far = numv_thus_far + 1;
%             [vn1, vn2, t2_index] = find_vname(t1.Vname(i));
%             if (vn1 == 0)
%                 B(vn2, numv_thus_far) = B(vn2, numv_thus_far) - 1;
%             elseif (vn2 == 0)
%                 B(vn1, numv_thus_far) = B(vn1, numv_thus_far) + 1;
%             else
%                 B(vn2, numv_thus_far) = B(vn2, numv_thus_far) - 1;
%                 B(vn1, numv_thus_far) = B(vn1, numv_thus_far) + 1;
%             end
%         end
%     end
%     
%     numv_thus_far = numV;
%     for i = 1:size(t1,1)
%         temp = char(t1.element(i));
%         x = temp(1); 
%         if x == 'F'
%             numv_thus_far = numv_thus_far + 1;
%             [vn1, vn2, t2_index] = find_vname(t1.Vname(i));
%             if (vn1 == 0)
%                 C(numv_thus_far,vn2) = C(numv_thus_far,vn2) - 1;
%             elseif (vn2 == 0)
%                 C(numv_thus_far,vn1) = C(numv_thus_far,vn1) + 1;
%             else
%                 C(numv_thus_far,vn2) = C(numv_thus_far,vn2) - 1;
%                 C(numv_thus_far,vn1) = C(numv_thus_far,vn1) + 1;
%             end
%         end
%     end

    %numv_thus_far = numV;
    for i = 1 : size(t1, 1)
        n1 = t1.p_node(i);
        n2 = t1.n_node(i);
        temp = char(t1.element(i));
        x = temp(1);
        if x == 'F'
%             numv_thus_far = numv_thus_far + 1;
            [vn1, vn2, t2_index] = find_vname(t1.Vname(i));
            if (n1 == 0)
                B(n2, t2_index) = B(n2, t2_index) - t1.value(i);
            elseif (n2 == 0)
                B(n1, t2_index) = B(n1, t2_index) + t1.value(i);
            else
                B(n2, t2_index) = B(n2, t2_index) - t1.value(i);
                B(n1, t2_index) = B(n1, t2_index) + t1.value(i);
            end
                     
        end
    end
end


   